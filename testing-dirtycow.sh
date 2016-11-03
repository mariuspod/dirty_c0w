#!/bin/sh
set -e

# run the test script
echo "$(/usr/games/cowsay -f tux 'You are SAFE!')" > foo
echo "                                                                                                                                                                  " >> foo
chmod 404 foo
./dirtyc0w foo "$(/usr/games/cowsay 'MOOOOOOOOOOOOOOOO!, You are VULNERABLE! Update your kernel!')" &
sleep 2
cat foo
if [ "$POST_TO_LIBRATO" = "true" ]
then
  echo "posting to librato:"
  echo "https://metrics.librato.com/metrics/ih.dirty_c0w.vulnerable"
  /usr/bin/ruby post_status.rb
fi
