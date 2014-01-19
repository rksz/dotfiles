#!/bin/sh
#
#
#
#########################################

BASEPATH=$(cd `dirname $0`; pwd)
CMDNAME=$(basename $0)


main() {

    #Validation
    if [[ $# -lt 1 ]]; then
        set -x
        echo "usage: $CMDNAME" 1>&2
        set +x
        exit 1
    fi

    #Main

}

logging() {
    now=$(date "+%Y-%m-%d %H:%M:%S")
    mode=$1
    msg=$2
    echo -e "\e[33m ${now} [${mode}]: ${msg} \e[m"
}

main "$@"
