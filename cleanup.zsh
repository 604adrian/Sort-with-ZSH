#!/bin/zsh

for dir in */; do
  cd $dir
  rm *pdf
  cd ..
done
