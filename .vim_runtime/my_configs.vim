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
            \'json': ['fixjson'],
            \'python': ['autopep8']
            \}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
" Set javascript linter.
let g:ale_linters = {
            \'javascript': ['eslint'],
            \'html': ['tidy'],
            \'css': ['csslint'],
            \'json': ['jsonlint'],
            \'python': ['pylint']
            \}


" Prettier config settings
" --tab-wdith <int>: Change default indentation from 2 to 4 for Javascript
" --no-bracket-spacing: Remove default spacing between brackets
" let g:ale_javascript_prettier_options = '--tab-width 2 --no-bracket-spacing'
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


" Redirect back to original path after reconnecting external SSD
" can be called in the vim terminal via :Reset
command! Reset cd | cd %:h


" Indentation settings
" For Python files, 4 spaces
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab
" For SQL files, 4 spaces
autocmd FileType sql setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab
" By default, 2 spaces.
set tabstop=2       " The width of a TAB is set to 2.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 2.
set shiftwidth=2    " Indents will have a width of 2.
set softtabstop=0   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.


" display line number
set number
" set line number width
set nuw=1
" set color for line number, this overwrites the default colorscheme
highlight LineNr ctermfg=grey


" Enable auto close of preview window when using semantic engine
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1


" remap enter key to ctrl-y in insert mode
" allow enter key to dismiss preview in YCM
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
" Enable indentation and unindentation during insert mode


" Javascript auto doc settings
" Allow prompt for interactive input.
let g:jsdoc_allow_input_prompt = 1
" Prompt for a function description
let g:jsdoc_input_description = 1
" Prompt for a value for @name, add it to the JSDoc block comment along with the @function tag.
let g:jsdoc_additional_descriptions = 1
" Set value to 1 to turn on detecting underscore starting functions as private convention
let g:jsdoc_underscore_private = 1
" Enable to use ECMAScript6's Shorthand function, Arrow function.
let g:jsdoc_enable_es6 = 1


" Enable or disable GitGutter
let g:gitgutter_enabled = 1
" To turn on or off line higlighting
let g:gitgutter_highlight_lines = 0
" map leader + g to toggle GitGutter
nmap <Leader>g :GitGutterToggle<CR>
" diff marker update time option, default = 4000
set updatetime=100


" Enable yank to copy to clipboard, delete will also be put into the Clipboard
set clipboard=unnamed
" type "*p instead of p to instantly paste large chunks of data into vim


" Shows partial commands in the last line of the screen
set showcmd


" ctrl + j to toggle between javascript mode and javascript.jsx mode
" javascript.jsx mode is the default value
" path autocomplete does not work on jsx mode
nnoremap <C-j> :call JsxToggle()<cr>
function! JsxToggle()
  if &filetype ==# 'javascript.jsx'
    setlocal ft=javascript
  else
    setlocal ft=javascript.jsx
  endif
endfunction


"Show filename in titlebar
set title


" C# plugin
" let g:OmniSharp_server_stdio = 1
