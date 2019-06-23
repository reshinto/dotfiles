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
let g:ale_javascript_prettier_options = '--tab-width 4 --no-bracket-spacing'
" let g:ale_css_stylelint_options = '--indentation 4'


" NERD Tree settings
" Close NERD Tree after opening a file
let NERDTreeQuitOnOpen = 1
" Show hidden files
let NERDTreeShowHidden = 1
" Open and close menu with leader + n
nmap <Leader>n :NERDTreeToggle<CR>


" Remove default left padding
set foldcolumn=0

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
" can be called in the vim terminal via :Reset
command! Reset cd | cd %:h
