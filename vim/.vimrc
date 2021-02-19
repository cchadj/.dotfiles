" Stops inserting commenting after pressing Enter on a commented line
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set formatoptions-=cro

" autoformat c files using astyle
" astyle # --indent=force-tab-x=4
autocmd BufNewFile,BufRead *.cpp set formatprg=astyle\ -T4p
autocmd BufNewFile,BufRead *.c set formatprg=astyle\ -T4p

filetype plugin indent on

set visualbell

set number

set mouse=a

set laststatus=2
let mapleader = ","


" >>> 
" yanked vim text goes to windows system clipboard 
let s:clip = '/mnt/c/Windows/System32/clip.exe' 
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    augroup END
end
" copied text from windows can be pased  with "+p
noremap "+p :exe 'norm a'.system('/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard')<CR>
" <<<

" >>> Insert and Normal View cursor >>>
augroup myCmds
  au!
  autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
" <<< Insert and Normal View cursor <<<

" >>> PLUGINS >>>
" install vim-plug if it doesn't already exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" :PlugInstall to install the plugins
" :PlugClean to remove plugins that were removed
" :PlugUpdate to update plugins
" :PlugUpgrade to upgrade vim-plug
" :PlugStatus to see the health status of each plugin

" for fast html generation
" example:
" type in code: div>.some-class*3>ul>li*4 and then <C-y>,
Plug 'mattn/emmet-vim'


" python syntax highlight
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" provides a lot of language packs
Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" A simple fast and powerful snippet tool. Add sniptes to 
" some keystroked and fill them.
" Plug 'SirVer/ultisnips'

" Fuzzy finder, roughly type the name of
" the file you want to find in your project 
" and it will find it for you.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'https://github.com/ctrlpvim/ctrlp.vim'

Plug 'preservim/nerdcommenter'

Plug 'tpope/vim-surround'
" change " to ' => cs"'
" change ' to <q></q> =>  cs'<q>
" remove " => ds"
" suround i(nner)w(ord) with ' => ysiw' => 'word'
" same but space  => ysiw]' ( word )
" also in visual mode you van surround
" selected sentence with <div class=some-class>
" </div> 
" by selecting the sentence and S
" example:
" a sentence
" 
" <div class=some-class>a sentence</div>

" change status line to be nicer
" One of the two
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Ctr + L to justify your .js file
Plug 'maksimr/vim-jsbeautify'

" Plug 'dense-analysis/ale'
"post install (yarn install | npm install) then load plugin only for editing
Plug 'prettier/vim-prettier', {'do': 'npm install', 'branch': 'release/0.x' }


" Color schemes
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'

" Navigate seamlessly between tmux and vim with Ctrl + hjkl
Plug 'christoomey/vim-tmux-navigator'

"
Plug 'Chiel92/vim-autoformat'

call plug#end()
" <<<  PLUGINS <<<


" >>> PYTHON HOSTING >>>
let g:python_host_prog="/home/tom/anaconda3/envs/py27/bin/python"
let g:python3_host_prog="/home/tom/anaconda3/envs/py38/bin/python"
" <<< PYTHON HOSTING <<<


" >>> Prettier >>>
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_require_pragma = 0

inoremap <C-l> <Esc>:PrettierAsync<CR>i
nnoremap <C-l> :PrettierAsync<CR>
" <<< Pretier <<<


autocmd vimenter * ++nested colorscheme gruvbox


" >>> FZF <<<
inoremap \\ <Esc>:GFiles<CR>i
nnoremap \\ :GFiles<CR>
" <<< FZF <<<

" >>> MY KEYBINDINGS >>>
" clear search highlight and reset search
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

" show all buffers and select buffer from them easily
nnoremap <F5> :buffers<CR>:buffer<Space>
" <<< MY KEYBINDINGS <<<

" >>> tmux-vim navigator mappings >>>
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-\> :TmuxNavigatePrevious<cr>
" <<< tmux-vim navigator mappings <<<

" >>> emmet settings >>>
let g:user_emmet_settings = {
  \    'javascript' : {
  \        'quote_char': ""
  \    }
  \}
" <<< emmet settings <<<

set wildmenu

source ~/.config/vim/coc.vim

source ~/.config/vim/nerdcommenter.vim

source ~/.config/vim/statusline.vim
