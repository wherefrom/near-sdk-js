#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
QJSC=${SCRIPT_DIR}/../res/qjsc
TEMP=$(basename ${1%.*}).h
TARGET=$(basename ${1%.*}).base64

${QJSC} -c -m -o ${TEMP} -N code $1
node ${SCRIPT_DIR}/save_bytecode.js ${TEMP} ${TARGET}
rm ${TEMP}
