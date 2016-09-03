#!/usr/bin/env bash

rm -r compiled \
      *.rkt~ \
      \#*.rkt\#*\# \
      &> /dev/null
exit 0
