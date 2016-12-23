filetype off
filetype plugin indent on
syntax on
colorscheme Tomorrow-Night

if exists('&breakindent')
  set breakindent      " Indent wrapped lines up to the same level
endif
set expandtab          " Expand tabs into spaces
set gfn=Meslo\ LG\ M\ DZ\ for\ Powerline:h12
set hidden
set history=1000
set hlsearch
set incsearch
set laststatus=2       " always show status bar
set modifiable
set mouse=a
set nocompatible
set number
set shiftwidth=2       " for when <TAB> is pressed at the beginning of a line
set showcmd            " display incomplete commands
set scrolloff=3
set softtabstop=2      " default to 2 spaces for the soft tab
set splitright
set tags=./tags,tags
set t_ut=
set tabstop=2          " default to 2 spaces for a hard tab
set pastetoggle=<F2>

" MAPPINGS
iabbrev @@ nadberezny@gmail.com
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
inoremap jk <esc>
nnoremap <Space> :w<CR>
nnoremap <leader>] :vsp<CR>
nnoremap <leader>[ :sp<CR>
nnoremap <leader>T :enew<cr>
nnoremap <leader>' :bnext<CR>
nnoremap <leader>; :bprevious<CR>
nnoremap <leader>w :bp <BAR> bd #<CR>
nnoremap <leader>l :ls<CR>
vnoremap <C-S-c> "+y
nnoremap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:UltiSnipsExpandTrigger = '<C-h>' " to jump: c-j
let g:move_key_modifier = 'C' " vim move with c-j c-k
" ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)
nnoremap <leader>y :! ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths) [ENTER]

" ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_max_files = 0
let g:ctrlp_cache_dir = $HOME . '/.vim/cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Speed up: gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" airline
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1 " Show PASTE if in paste mode
let g:airline#extensions#tabline#enabled = 1 " Show airline for tabs too

" syntastic
let g:syntastic_elixir_checkers = ['elixir']
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec = '/Users/j/.rvm/gems/ruby-2.3.1/bin/rubocop'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END


" gitgutter
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"let g:NERDTreeIndicatorMapCustom = {
     ""Modified"  : "✹",
     ""Staged"    : "✚",
     ""Untracked" : "✭",
     ""Renamed"   : "➜",
     ""Unmerged"  : "═",
     ""Deleted"   : "✖",
     ""Dirty"     : "✗",
     ""Clean"     : "✔︎",
     ""Unknown"   : "?"
     "}

" Space for nerd commenter
let NERDSpaceDelims=1

" delimitMate
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},':'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" better-whitespace
autocmd BufWritePre * StripWhitespace

" PLUGINS
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Raimondi/delimitMate'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-surround'
Plugin 'rking/ag.vim'
Plugin 'matze/vim-move'
Plugin 'elixir-lang/vim-elixir'
Plugin 'mxw/vim-jsx'
call vundle#end()
