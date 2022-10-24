" If we've already loaded the plugin, than don't do it again unless you want problems
if exists('g:loaded_readability') | finish | endif

" Save user coptions
let s:save_cpo = &cpo
set cpo&vim

command! Readability lua require('readability').readability()

" Restore user options
let &cpo = s:save_cpo
unlet s:save_cpo

" That's it! We finished loading the plugin
let g:loaded_md_to_html = 1
