#!/usr/bin/env bash
if [ $# -ne 1 ]; then
    echo "You must provide a name of a new function"
    exit 1
fi

FN_NAME="$1"; shift

if [[ $FN_NAME == *"?" ]]; then
    BASE_NAME="${FN_NAME%%?}-p"
else
    BASE_NAME="${FN_NAME}"
fi

SOURCE_PATH="${BASE_NAME}.rkt"
TEST_PATH="tests/${BASE_NAME}-test.rkt"

for file in "${SOURCE_PATH}" "${TEST_PATH}"; do
    if [ -f "$file" ]; then
        echo "$file already exists, quitting"
        exit 1
    fi
done

echo "creating $FN_NAME files"

cp base.rkt.tmpl "${SOURCE_PATH}"
cp base-test.rkt.tmpl "${TEST_PATH}"

for file in "${SOURCE_PATH}" "${TEST_PATH}"; do
    sed -i "s/FN_NAME/${FN_NAME}/" "$file"
    sed -i "s/BASE_NAME/${BASE_NAME}/" "$file"
done
