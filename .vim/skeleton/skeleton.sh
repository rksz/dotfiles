#!/bin/sh
#
#
#
#########################################

BASEPATH=$(cd `dirname $0`; pwd)

main() {

    log "INFO" "START"
        set -x
        set +x

}

log() {
    now=$(date "+%Y-%m-%d %H:%M:%S")
    mode=$1
    msg=$2
    echo -e "\e[33m ${now} [${mode}]: ${msg} \e[m"
    # echo "${now} [${mode}]: ${msg}"
}

main "$@"
