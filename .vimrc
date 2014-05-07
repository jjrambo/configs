set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set pastetoggle=<F2>

set listchars=tab:>-,trail:-
set list

let mapleader =  ","

noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier exiting of insert mode
imap kj <esc>
imap jj <esc>
imap jk <esc>

" Show whitespace
" Must be before colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

" Enable syntax highlighting
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
syntax on

set number
set tw=79
set nowrap
set fo-=t " do not automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w
" + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>j
map <c-l> <c-w>j
map <c-h> <c-w>j

" easier moving between tabs
map<Leader>n <esc>:tabprevious<CR>
map<Leader>m <esc>:tabnext<CR>

" easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Setup Pathogen to manage plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/folder
call pathogen#infect()
call pathogen#helptags()

" ==========================
" Python IDE Setup
" ==========================

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=#.pyc
set wildignore+=$_build/*
set wildignore+=*/coverage/*

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone https://github.com/davidhalter/jedi-vim.git
" sudo pip install jedi
" let g:jedi#completions_command = '<Leader>c' " Testing
" Ctrl-Space for completions. Heck Yeah!
inoremap <C-Space> <C-X><C-O>

" Settings for syntastic
" cd ~/.vim/bundle
" git clone https://github.com/scrooloose/syntastic.git
" pip install pylint
" pip install pyflakes
let g:syntastic_auto_loc_list = 1
let g:syntastic_python_checkers=['pylint']
let g:syntastic_always_populate_loc_list=1

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for...
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
                return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/script
" wget above is incomplete, can't find the right one
set nofoldenable
