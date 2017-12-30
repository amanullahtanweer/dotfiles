set nocompatible
filetype off


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
" Plugin 'vim-ruby/vim-ruby'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-endwise'
Plugin 'mileszs/ack.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'scrooloose/nerdcommenter'

set backspace=indent,eol,start

set number
set ruler
set wrap
set guifont=Monaco:h15
set tabstop=2
set shiftwidth=2
set softtabstop=2
set encoding=utf8
set incsearch
set hlsearch
set nobackup
set autoread
set showmatch

call vundle#end()
filetype plugin indent on

colorscheme molokai


imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" map <leader>n :NERDTreeToggle<CR>

map <D-k> :NERDTreeToggle<CR>

nmap <D-/> <leader>c<Space>
vmap <D-/> <leader>c<Space>

map <D-P> :CtrlP<CR>
vmap <D-P> :CtrlP<CR>
imap <D-P> <ESC>:CtrlP<CR>

nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

augroup autoindent
	au!
	autocmd BufWritePre * :normal migg=G`i
augroup End


augroup AuNERDTreeCmd
	autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()

	let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
	let g:ctrlp_map = ''
	let g:ctrlp_custom_ignore = {
				\ 'dir':  '\v[\/]\.(git|hg|svn)$|bower_components|node_modules|tmp',
				\ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
				\ }


	let g:user_emmet_expandabbr_key='<Tab>'
	let g:ctrlp_use_caching = 0

	let macvim_hig_shift_movement = 1

	let g:delimitMate_expand_cr = 1
	let g:delimitMate_expand_space = 1
	" NERDTree utility function
	function s:UpdateNERDTree(...)
		let stay = 0

		if(exists("a:1"))
			let stay = a:1
		end

		if exists("t:NERDTreeBufName")
			let nr = bufwinnr(t:NERDTreeBufName)
			if nr != -1
				exe nr . "wincmd w"
				exe substitute(mapcheck("R"), "<CR>", "", "")
				if !stay
					wincmd p
				end
			endif
		endif
	endfunction



	map <D-1> 1gt
	map <D-2> 2gt
	map <D-3> 3gt
	map <D-4> 4gt
	map <D-5> 5gt
	map <D-6> 6gt
	map <D-7> 7gt
	map <D-8> 8gt
	map <D-9> 9gt


	imap <D-1> <esc>1gt
	imap <D-2> <esc>2gt
	imap <D-3> <esc>3gt
	imap <D-4> <esc>4gt
	imap <D-5> <esc>5gt
	imap <D-6> <esc>6gt
	imap <D-7> <esc>7gt
	imap <D-8> <esc>8gt
	imap <D-9> <esc>9gt
