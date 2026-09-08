Partition: md_udc
String found: yes
Direct strings: 1
Embedded strings: 1
Operations in analyzed flows: 2

- direct_string VA=0x00000000480f47cc off=0xf47cc HxD=000F47CC text='md_udc'
- embedded_string VA=0x0000000048106da4 off=0x106da4 HxD=00106DA4 text='Failed to erase md_udc.\n'

Operations:
- erase xref=0x0000000048082a6e call=0x0000000048082a70 target=0x000000004805bd88 mode=direct_string
- erase xref=0x0000000048082a82 call=0x0000000048082a86 target=0x0000000048052000 mode=direct_string
