#!/usr/bin/env bash
if [ $# -ne 1 ]; then
    echo "You must provide a name of a new function"
    exit 1
fi

NAME="$1"; shift

SOURCE="${NAME}.rkt"
TEST="tests/${NAME}-test.rkt"

for file in "${SOURCE}" "${TEST}"; do
    if [ -f "$file" ]; then
        echo "$file already exists, quitting"
        exit 1
    fi
done

echo "creating $NAME files"

cp base.rkt.tmpl "${SOURCE}"
cp base-test.rkt.tmpl "${TEST}"

for file in "${SOURCE}" "${TEST}"; do
    sed -i "s/NAME/${NAME}/" "$file"
done
