#!/bin/sh
set -e

# run the test script
echo "$(/usr/games/cowsay -f tux 'You are SAFE!')" > foo
echo "                                                                                                                                                                  " >> foo
chmod 404 foo
./dirtyc0w foo "$(/usr/games/cowsay 'MOOOOOOOOOOOOOOOO!, You are VULNERABLE! Update your kernel!')" &
sleep 2
cat foo
