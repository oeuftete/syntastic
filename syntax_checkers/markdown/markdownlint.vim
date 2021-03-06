"============================================================================
"File:        markdownlint.vim
"Description: Syntax checking plugin for syntastic
"Maintainer:  Ken Crowell <oeuftete at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists('g:loaded_syntastic_markdown_markdownlint_checker')
    finish
endif
let g:loaded_syntastic_markdown_markdownlint_checker = 1

if !exists('g:syntastic_markdown_markdownlint_sort')
    let g:syntastic_markdown_markdownlint_sort = 1
endif

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_markdown_markdownlint_GetLocList() dict
    let makeprg = self.makeprgBuild({ 'args': '' })

    let errorformat = '%E%f:%\s%\=%l %m'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'subtype': 'Style' })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'markdown',
    \ 'name': 'markdownlint'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
