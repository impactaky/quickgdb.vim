#!/bin/bash

tty_=`tty`

cat << EOF > gdb_run.py

import gdb

gdb.execute('file $1')
gdb.execute('break $2:$3')
gdb.execute('start')

while True:
    gdb.execute('continue')
    message = gdb.execute('info program', to_string=True)
    if message == 'The program being debugged is not being run.\n':
        break
    o = gdb.execute('output $4', to_string=True)
    print('  $4 :', o)

gdb.execute('quit')

EOF

gdb -q -x gdb_run.py | grep "  $4 :"
