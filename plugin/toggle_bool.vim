" --------------------------------
" Add our plugin to the path
" --------------------------------
py3 import sys
py3 import vim
py3 sys.path.append(vim.eval('expand("<sfile>:h")'))

" --------------------------------
"  Function(s)
" --------------------------------
function! TemplateExample()
py3 << endOfPython

from toggle_bool import toggle_bool_value

# get word under cursor
wordUnderCursor = vim.eval('expand("<cword>")')

if len(wordUnderCursor):
  # get the toggle value of word under cursor
  toggleValue = toggle_bool_value(wordUnderCursor)

  # replace the current word with new toggled value
  vim.command('normal viwc%s' % toggleValue)
  vim.command('normal b')

endOfPython
endfunction

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! ToggleBool call TemplateExample()

" key mapping
" noremap <leader>r :ToggleBool<CR>
