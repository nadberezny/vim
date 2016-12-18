filetype off
"filetype plugin indent on
syntax on
colorscheme Tomorrow-Night

set history=1000
set number
set modifiable
set mouse=a
set nowrap
set hidden
set expandtab          " Expand tabs into spaces
set tabstop=2          " default to 2 spaces for a hard tab
set softtabstop=2      " default to 2 spaces for the soft tab
set shiftwidth=2       " for when <TAB> is pressed at the beginning of a line
set laststatus=2       " always show status bar
"ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)
set tags=./tags,tags
"set tags=./tags;,~/.vimtags
"set tags+=gems.tags
"set tags=./tags;c:/ruby/lib/tags

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
" Open/close NERDTree Tabs with \t
nnoremap <silent> <leader>t :NERDTreeTabsToggle<CR>

" ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0

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

" vim-move
let g:move_key_modifier = 'C'

" easy tags
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 1
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

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
