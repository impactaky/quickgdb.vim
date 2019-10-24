let s:quickgdb_script_path=expand('<sfile>:p:h').'/../native/script.sh'

function! quickgdb#build()
    if exists('g:quickgdb_buildCommand')
        execute(printf('AsyncRun %s', g:quickgdb_buildCommand))
    elseif exists('b:quickgdb_buildCommand')
        execute(printf('AsyncRun %s', b:quickgdb_buildCommand))
    endif
endfunction

function! quickgdb#run()
    if exists('g:quickgdb_runCommand')
        execute(printf('AsyncRun %s', g:quickgdb_runCommand))
    elseif exists('b:quickgdb_runCommand')
        execute(printf('AsyncRun %s', b:quickgdb_runCommand))
    else
        execute(':QuickRun')
    endif
endfunction

function! quickgdb#printDebug()
    " call quickgdb#build()
    if exists('g:quickgdb_execfile')
        execute ':AsyncRun' s:quickgdb_script_path
                    \ g:quickgdb_execfile expand('%') line('.') expand('<cword>')
    elseif exists('b:quickgdb_execfile')
        execute ':AsyncRun' s:quickgdb_script_path
                    \ b:quickgdb_execfile expand('%') line('.') expand('<cword>')
    endif
endfunction

