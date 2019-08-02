"	8    8 8""8""8 8
"	8    8 8  8  8 8
"	eeeeee 8e 8  8 8e
"	88   8 88 8  8 88
"	88   8 88 8  8 88
"	88   8 88 8  8 88eee

autocmd FileType xml inoremap ,gradef
	\ <graphics type='spice' autoport='yes'>
	\ <CR><listen type='spice'/>
	\ <CR><image compression='off'/>
	\ <CR></graphics>
	\ <Esc>

autocmd FileType xml inoremap ,gra<Space>
	\ <graphics type='' autoport='yes'>
	\ <CR><listen type='<++>'/>
	\ <CR></graphics>
	\ <Esc>2kf'a

autocmd FileType xml inoremap ,condef
	\ <console type='pty'>
	\ <CR><target type='serial' port='0'/>
	\ <CR></console><Esc>

autocmd FileType xml inoremap ,con<Space>
	\ <console type=''>
	\ <CR><target type='<++>' port='0'/>
	\ <CR></console>
	\ <Esc>2kf'a

autocmd FileType xml inoremap ,memdef
	\ <memory unit='GB'>2</memory>
	\ <CR><currentMemoryunit='GB'>2</memory>

autocmd FileType xml inoremap ,mem<Space>
	\ <memory unit='GB'></memory>
	\ <CR><currentMemory unit='GB'></memory>
	\ <Esc>kF<i
