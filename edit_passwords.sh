#!/bin/bash

IFS=$'\n'

for line in $(find .password-store/ -type f -name "*.gpg"); do
    v1=${line%%.gpg}
    v2=${v1##.password-store/}
    pass edit "$v2"
done
