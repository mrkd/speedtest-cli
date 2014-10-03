#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Script directory: ${SCRIPT_DIR}"
DATA_DIR="data"
# create data directory if doesn't exist
mkdir -p ${DATA_DIR}

DATE_TIME=`date +%Y.%m.%d-%H.%M.%S`
touch ${SCRIPT_DIR}/${DATA_DIR}/speedtest-results.txt
#${SCRIPT_DIR}/speedtest.sh >${SCRIPT_DIR}/${DATA_DIR}/speedtest-$DATE_TIME.txt
python ${SCRIPT_DIR}/speedtest_cli.py --csv >>${SCRIPT_DIR}/${DATA_DIR}/speedtest-results.txt