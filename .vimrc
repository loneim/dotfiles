" Type :so % to refresh .vimrc after making changes

" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.syntax on

set number
set relativenumber
colo molokai 
set cursorline          " highlight current line
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set showcmd             " display incomplete command
set laststatus=2        " Always display the status line
set autoread            " Reload files changed outside vim
set backspace=2         " Backspace deletes like most programs in insert mode
set mouse=a
set nobackup
set nowritebackup
set noswapfile    			" http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler 
autocmd VimEnter * set autoindent

" Make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

" Automatic open NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Open new split panes to right and bottom, which feels more natural
" set splitbelow
set splitright

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" Make searching better
set ignorecase          " case insensitive searching (unless specified)
set smartcase
set incsearch
set showmatch

" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" copy and paste
set clipboard+=unnamedplus  " use the clipboards of vim and win
set paste               " Paste from a windows or from vim
set go+=a               " Visual selection automatically copied to the clipboard
vmap <C-c> "+yi
vmap <C-x> "+c
nnoremap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
nnoremap y "*y
nnoremap p "*p

execute pathogen#infect()
call pathogen#helptags()

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Automatic close NERDTree if last buffen
function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction
augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END
