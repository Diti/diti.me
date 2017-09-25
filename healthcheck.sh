#!/bin/sh

if hugo --renderToMemory --verbose | grep --ignore-case '^error'; then
  exit 1
else
  exit 0
fi

