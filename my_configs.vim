" python-mode: enable python 3 syntax checking, this setting may not be required
" let g:pymode_python = 'python3'
let g:pymode_lint_checkers = ['pylint']
let g:ale_python_pylint_options = '--rcfile /Users/springfield/.pylintrc'
" Use message for output (e.g. I0011) instead of symbolic name of the message
let g:ale_python_pylint_use_msg_id = 1
" Disable python mode colorcolumn
let g:pymode_options_colorcolumn = 0

" completor: enable javascript completion, this setting may not be required
" let g:completor_node_binary = '/usr/local/bin/node'


" Enable indentation during command mode
nnoremap <Tab> >>_
" Enable unindentation during command mode
nnoremap <S-Tab> <<_
" Enable indentation and unindentation during insert mode
inoremap <S-Tab> <C-D>
" Enable indentation during visual mode
vnoremap <Tab> >gv
" Enable unindentation during visual mode
vnoremap <S-Tab> <gv


" ALE settings
" Fix files with prettier, and then ESLint.
let g:ale_fixers = {
            \'*': ['remove_trailing_lines', 'trim_whitespace'],
            \'javascript': ['eslint'],
            \'html': ['prettier'],
            \'css': ['prettier'],
            \'json': ['fixjson']
            \}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
" Set javascript linter.
let g:ale_linters = {
            \'javascript': ['eslint'],
            \'html': ['tidy'],
            \'css': ['csslint'],
            \'json': ['jsonlint']
            \}

" Prettier config file
" --tab-wdith <int>: Change default indentation from 2 to 4 for Javascript
" --no-bracket-spacing: Remove default spacing between brackets
let g:ale_javascript_prettier_options = '--tab-width 2 --no-bracket-spacing'
" let g:ale_css_stylelint_options = '--indentation 4'


" NERD Tree settings
" Close NERD Tree after opening a file
let NERDTreeQuitOnOpen = 1
" hide hidden files, default is 0, change to 1 to show
let NERDTreeShowHidden = 0
" Open and close menu with leader + n
nmap <Leader>n :NERDTreeToggle<CR>


" Remove default left padding
set foldcolumn=0

" Prevents JS from auto folding
au FileType javascript setlocal nofoldenable
" Prevents markdown from auto folding
au FileType markdown setlocal nofoldenable



" Set column limit to 80 for python and javascript
" Set color column for python & javascript if exceed limit, display when exceeded at 81
augroup collumnLimit
  autocmd!
  autocmd BufEnter,WinEnter,FileType python,javascript
        \ highlight CollumnLimit ctermbg=red guibg=red
  let collumnLimit = 81 " feel free to customize
  let pattern =
        \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
  autocmd BufEnter,WinEnter,FileType python,javascript
        \ let w:m1=matchadd('CollumnLimit', pattern, -1)
augroup END


" Set colorscheme for vim
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai


" redirect back to original path after reconnecting external SSD
" can be call in the vim terminal via :Reset
command! Reset cd | cd %:h


" Indentation settings
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on

    " Use actual tab chars in Makefiles.
    autocmd FileType python set tabstop=4 shiftwidth=4 softtabstop=0 expandtab
endif
" For everything else, use a tab width of 2 space chars.
set tabstop=2       " The width of a TAB is set to 2.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 2.
set shiftwidth=2    " Indents will have a width of 2.
set softtabstop=0   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.
