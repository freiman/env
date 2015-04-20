"
" !!!! Maintained by puppet !!!!
"

" Special characters can be manually or automatically added to your text to flag the start and end of folds
set foldmethod=marker

" More powerful backspacing
set backspace=indent,eol,start

" Don't wrap words by default
set textwidth=0

" Insert space characters whenever the tab key is presse
set expandtab
" To control the number of space characters that will be inserted when the tab key is pressed
set tabstop=4
" To change the number of space characters inserted for indentation
set shiftwidth=4
" To control how many columns vim uses when you hit Tab in insert mode
set softtabstop=4

" Show (partial) command in status line.
set showcmd

" Show matching brackets.
set showmatch

" statusline
set laststatus=2

" Use Vim defaults instead of 100% vi compatibility
set nocompatible

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" Debian uses compressed helpfiles. We must inform vim that the main
" helpfiles is compressed. Other helpfiles are stated in the tags-file.
set helpfile=$VIMRUNTIME/doc/help.txt.gz

if has("autocmd")
  " Enabled file type detection
  " Use the default filetype settings. If you also want to load indent files
  " to automatically do language-dependent indenting add 'indent' as well.
  filetype plugin on
  filetype indent on
  set grepprg=grep\ -nH\ $*
endif " has ("autocmd")

" Some Debian-specific things
augroup filetype
  au BufRead reportbug.*        set ft=mail
  au BufRead reportbug-*        set ft=mail
augroup END

" [krux]
"au BufNewFile *.php | exe "normal i<?php\<Enter>\<Enter>?>\<ESC>:2\<Enter>i\t"

" File encodings
set fileencodings=utf-8,iso-8859-2,latin2,latin1

" Zvyraznovani syntaxe u vyhledavani
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" zalohy souboru
set backup
set backupdir=~/.vim/backup

" docasne soubory
set directory=~/.tmp,.,/tmp

" ulozeni buffery do viminfo
set confirm
set viminfo='50,\"500
set history=50

" interaktivni vyhledavani - ukazuje hledany text uz pri jeho psani
set incsearch

" doplnovani nazvu souboru a prikazu
set wildchar=<Tab>
set wildmenu
set wildmode=longest:full,full

" osetreni ceskych klaves v rezimu prikazoveho radku
set langmap=ì2,¹3,è4,ø5,¾6,ý7,á8,í9,é0,-/,_?

" namapovani kurzorovych sipek
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

" zpetna kontrola zavorek
set showmatch

" titulek okna
set title
" set titlestring=VIM\ -\ %t

" minimalni pocet radku pred a za kurzorem
set scrolloff=6

" minimalni pocer sloupcu pred a za kurzorem
set sidescroll=10

" nastavi odradkovani
set autoindent

" nastavi chytre odradkovani
set smartindent

" vypnuti dvoji mezery po znacich ".", ",", "?"...
set nojoinspaces

" nedelit dlhy riadok
"set nowrap

" nahradi zvyrazneny text textem z registru (visualni mod)
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" vse co se ulozi do unnamed registru se ulozi i do clipboardu
set clipboard=unnamed

set paste

set gdefault

set background=dark

" disable bracket highlighting
:let loaded_matchparen = 1


if has("gui_running")
    " colorscheme jellybeans
    " colorscheme xoria256
    " colorscheme wombat256
    colorscheme molokai

    " Set gvim options
    set guioptions-=m
    set guioptions-=T
    " set guioptions-=r

    "Invisible character colors
    highlight NonText guifg=#4a4a59
    highlight SpecialKey guifg=#4a4a59

    " autocmd VimEnter * NERDTree

    " Go to home directory
    " cd ~/wwwroot/
else
    if &t_Co == 256
        colorscheme molokai
    endif
endif

let php_sql_query=1
let php_htmlInStrings=1

" filetype syntax
augroup filetype
    au!
    au! BufRead,BufNewFile *.js.php    set filetype=javascript number
    au! BufRead,BufNewFile *.css.php   set filetype=css
    au! BufRead,BufNewFile *.sql.php   set filetype=mysql
    au! BufRead,BufNewFile *.conf.m4   set filetype=apache
    au! BufRead,BufNewFile *.php*.tmp   set filetype=php number
augroup END

if has("gui_running")
    " PHP run command (CTRL-M)
    " :autocmd FileType php noremap <C-M> :!/usr/bin/env php %<CR>
    :autocmd FileType php noremap <C-M> :!/usr/local/bin/php %<CR>

    " PHP parser check (CTRL-L)
    " :autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>
    :autocmd FileType php noremap <C-L> :!/usr/local/bin/php -l %<CR>
else
    " PHP run command (CTRL-M)
    " :autocmd FileType php noremap <C-M> :!/usr/bin/env php %<CR>
    :autocmd FileType php noremap <C-M> :!/usr/bin/clear && /usr/local/bin/php %<CR>

    " PHP parser check (CTRL-L)
    " :autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>
    :autocmd FileType php noremap <C-L> :!/usr/bin/clear && /usr/local/bin/php -l %<CR>
endif

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" No smartindent, No autoindent
" Nutne premapovat na nieco ine, C-A sluzi na incrementovanie cisel a nejde to zmenit
" nmap <C-A> :set nosmartindent noautoindent<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
    call SummarizeTabs()
endfunction
 
function! SummarizeTabs()
    try
        echohl ModeMsg
        echon 'tabstop='.&l:ts
        echon ' shiftwidth='.&l:sw
        echon ' softtabstop='.&l:sts
        if &l:et
            echon ' expandtab'
        else
            echon ' noexpandtab'
        endif
        finally
        echohl None
    endtry
endfunction

" poloha kurzoru
set ruler
