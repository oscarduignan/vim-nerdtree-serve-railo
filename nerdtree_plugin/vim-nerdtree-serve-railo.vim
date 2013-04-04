"guard against sourcing the script twice
if exists("g:loaded_nerdtree_serve_railo_mapping")
    finish
endif
let g:loaded_nerdtree_serve_railo_mapping = 1
 

call NERDTreeAddKeyMap({
    \ 'key': 'rs',
    \ 'callback': 'NERDTreeServeRailo',
    \ 'quickhelpText': 'serve railo from this dir on http://localhost:8888' })
 

function! NERDTreeServeRailo()
 
    "grab the currently selected dir node (returns 
    "the parent dir if a file is selected)
    let n = g:NERDTreeDirNode.GetSelected()
 
    try
        call ServeRailo(n.path.str({'format': 'Cd'}))
    endtry
 
endfunction


command! -nargs=1 ServeRailo call ServeRailo(<f-args>)
function! ServeRailo(path)
    " start in cmd window asyncronously and suppress 'Enter to continue' notice
    exec 'silent !start cmd /k serve_railo "' . a:path . '"'
endfunction
                                                              
