#!/usr/bin/env bash

shopt -s globstar # (enable ** matching)

rm -r compiled \
      **/*.rkt~ \
      **/\#*.rkt\#*\# \
      **/coverage \
      &> /dev/null
exit 0
