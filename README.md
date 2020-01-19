# quickgdb.vim
Get information quickly from gdb.

## Requirements

* gdb (Python GDB scripts)
* bash
* grep command
* asyncrun.vim

## Example

``` vim:.vimrc
nmap <Leader>r <Plug>(quickgdb-run)
nmap <Leader>e <Plug>(quickgdb-printDebug)
let g:quick_async_run_command='cd ./build && ninja && ./test'
let g:quick_async_build_command='cd ./build && ninja'
let g:quickgdb_execfile='./build/test'
```

![example](https://github.com/impactaky/quickgdb.vim/blob/media/example.gif)



