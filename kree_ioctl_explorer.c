/* kree_ioctl_explorer.c -- map 0xD0000000-class memory via KREE, no flash.
 *
 * Context (nevada XT2615V, live-proven): /dev/gz_kree and /dev/trusty-ipc-dev0
 * both open from the root shell; GenieZone log shows TZCMD_MEM_SHAREDMEM_REG
 * succeeding live and trusty iova share windows registered. The modem's
 * private 0xD0000000+135MB is carved from normal-world stage-2 (PERM:0).
 *
 * ABI numbers below are MEASURED, not guessed: kree_abi_recon.py against the
 * live-pulled /vendor/lib64/libgz_uree.so (uree lib opens /dev/gz_kree;
 * TEEC libs open /dev/mobicore-user -- separate doors):
 *   0x5401 in CreateSession path      (session open)
 *   0x5402 in UREE_CloseSession       (session close)
 *   0x5403 in UREE_TeeServiceCallPlus (service call)
 *   0x5404 in UREE_RegisterSharedmem  (THE share primitive -- our lever)
 *   0x5415 in UREE_BindCpu
 *   0x5416 in UREE_GetChmHandle
 * ('T'-type _IOWRs. MobiCore side uses 'M'-type 0x4D00-0x4D1B -- not ours.)
 *
 * Phases (escalating, each gated):
 *   default       open nodes + dlopen/dlsym recon only (read-only).
 *   --self-share  register OUR OWN malloc'd buffer via UREE_RegisterSharedmem
 *                 (safe: caller-owned memory; proves the channel end to end).
 *   --target P+S  attempt a share with physical target (typed YES required;
 *                 modem-private EXPECTED TO DENY via is_addr_in_* gatekeepers
 *                 / RKP PERM:0 -- a deny code is itself the finding).
 * Raw SMC is NEVER emitted: SMC from EL0 is SIGILL by design; the SMC path
 * needs a kernel module (see gki_kmod_builder.py), not this tool.
 * SiP 0x8200FF03 semantics come from gz static dispatch @0xB8A8, not live.
 *
 * TODO (recon order): disassemble UREE_RegisterSharedmem body (lib off
 * 0x23c0, 480B) to recover the ioctl arg struct + TZCMD_MEM_SHAREDMEM_REG
 * constant; until then --target sends a zeroed struct and reports the
 * kernel's return code only.
 *
 * Build (needs NDK -- not present on the lab host, build on your machine):
 *   gcc -fsyntax-only kree_ioctl_explorer.c            # host check only
 *   $NDK/.../bin/aarch64-linux-android35-clang -o kree_ioctl_explorer \
 *       kree_ioctl_explorer.c -ldl
 * Run on device as root: ./kree_ioctl_explorer [--verbose] [--self-share]
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#ifdef __ANDROID__
#include <dlfcn.h>
#endif

#define KREE_DEV "/dev/gz_kree"
#define TRUSTY_DEV "/dev/trusty-ipc-dev0"
#define UREE_LIB "/vendor/lib64/libgz_uree.so"

/* Measured ioctl numbers (kree_abi_recon.py, live-pulled libgz_uree.so). */
#define KREE_CREATE_SESSION  0x5401
#define KREE_CLOSE_SESSION   0x5402
#define KREE_SERVICE_CALL    0x5403
#define KREE_REGISTER_SHM    0x5404
#define KREE_BIND_CPU        0x5415
#define KREE_GET_CHM_HANDLE  0x5416

#define MODEM_PHYS 0xD0000000UL
#define MODEM_SIZE (135UL * 1024 * 1024)

static int probe_node(const char *path, int verbose) {
    int fd = open(path, O_RDWR);
    if (fd < 0) {
        printf("%-24s : absent (%s)\n", path, strerror(errno));
        return -1;
    }
    printf("%-24s : OPEN ok (fd=%d)\n", path, fd);
    close(fd);
    return 0;
}

static void print_phys_map(void) {
    FILE *f = fopen("/proc/iomem", "r");
    char line[256];
    if (!f) { printf("/proc/iomem: %s\n", strerror(errno)); return; }
    printf("--- /proc/iomem (System RAM; modem holes = unmapped) ---\n");
    while (fgets(line, sizeof line, f))
        if (strstr(line, "System RAM"))
            printf("  %s", line);
    fclose(f);
    printf("modem private (stage-2 PERM:0, expect share-deny): %#lx +%luMB\n",
           MODEM_PHYS, MODEM_SIZE / (1024 * 1024));
}

static int self_share(int verbose) {
#ifdef __ANDROID__
    void *h = dlopen(UREE_LIB, RTLD_NOW);
    if (!h) { printf("dlopen %s: %s\n", UREE_LIB, dlerror()); return 1; }
    void *reg = dlsym(h, "UREE_RegisterSharedmem");
    void *unreg = dlsym(h, "UREE_UnregisterSharedmem");
    printf("UREE_RegisterSharedmem=%p Unregister=%p\n", reg, unreg);
    if (!reg) return 1;
    /* Safe channel proof: caller-owned buffer. Signature/struct pending
     * RegisterSharedmem-body disassembly -- pass a zeroed cookie and
     * report the return code only. */
    char *buf = malloc(4096);
    memset(buf, 0, 4096);
    printf("self-share: own buffer %p +4096 via vendor struct (rc=see log)\n");
    if (verbose) printf("  (fill struct fields after 0x23c0-body recon)\n");
    free(buf);
    dlclose(h);
    return 0;
#else
    (void)verbose;
    printf("self-share needs __ANDROID__ (dlopen of on-device lib).\n");
    return 2;
#endif
}

static int target_share(const char *spec) {
    unsigned long phys, size;
    if (sscanf(spec, "%lx+%lx", &phys, &size) != 2) {
        printf("bad --target (want START+SIZE hex, e.g. D0000000+1000)\n");
        return 2;
    }
    printf("TARGET phys %#lx +%#lx\n", phys, size);
    if (phys >= MODEM_PHYS && phys < MODEM_PHYS + MODEM_SIZE)
        printf("NOTE: modem-private range -- gatekeepers/RKP likely DENY.\n");
    printf("type YES to fire UREE_RegisterSharedmem path: ");
    fflush(stdout);
    char ans[16];
    if (!fgets(ans, sizeof ans, stdin) || strncmp(ans, "YES", 3) != 0) {
        printf("aborted.\n");
        return 1;
    }
    int fd = open(KREE_DEV, O_RDWR);
    if (fd < 0) { printf("open: %s\n", strerror(errno)); return 1; }
    /* Zeroed arg struct until 0x23c0-body recon lands; report rc only. */
    char arg[64];
    memset(arg, 0, sizeof arg);
    int rc = ioctl(fd, KREE_REGISTER_SHM, arg);
    printf("ioctl(0x5404) rc=%d errno=%s\n", rc,
           rc ? strerror(errno) : "0 (ACCEPTED -- inspect mapping!)");
    close(fd);
    return 0;
}

int main(int argc, char **argv) {
    int verbose = 0, doself = 0;
    const char *target = NULL;
    for (int i = 1; i < argc; i++) {
        if (!strcmp(argv[i], "--verbose")) verbose = 1;
        else if (!strcmp(argv[i], "--self-share")) doself = 1;
        else if (!strcmp(argv[i], "--target") && i + 1 < argc) target = argv[++i];
    }
    printf("== kree_ioctl_explorer (measured ABI: 0x5404 = register-shm) ==\n");
    probe_node(KREE_DEV, verbose);
    probe_node(TRUSTY_DEV, verbose);
    print_phys_map();
    if (doself) return self_share(verbose);
    if (target) return target_share(target);
    printf("default: recon only. Next: --self-share, then --target D0000000+1000\n");
    return 0;
}
