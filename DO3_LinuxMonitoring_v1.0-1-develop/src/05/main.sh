#!/bin/bash

start="$(date +%s.%N)"
if [[ $# != 1 ]]; then
  echo "use 1 arguments"
elif [[ $1 =~ /$ ]]; then
  ./collect.sh $1 "\033[35m" "\033[0m"
  end="$(date +%s.%N)"
  runtime=$(echo "$end - $start" | bc -l)
  echo "Script execution time (in seconds) = $runtime"
else
  echo "need /"
fi