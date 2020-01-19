let s:quickgdb_script_path=expand('<sfile>:p:h').'/../native/script.sh'

function! quickgdb#build()
    if exists('g:quick_async_build_command')
        execute(printf('AsyncRun %s', g:quick_async_build_command))
    elseif exists('b:quick_async_build_command')
        execute(printf('AsyncRun %s', b:quick_async_build_command))
    endif
endfunction

function! quickgdb#run()
    if exists('g:quick_async_run_command')
        execute(printf('AsyncRun %s', g:quick_async_run_command))
    elseif exists('b:quick_async_run_command')
        execute(printf('AsyncRun %s', b:quick_async_run_command))
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

