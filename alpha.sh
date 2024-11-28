#!/bin/bash

set -x

a=mississipi

grep -o "s" <<<"$a" | wc -l
