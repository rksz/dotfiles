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
        echo "usage: $CMDNAME" 1>&2
        exit 1
    fi

    #Main

}

logging() {
    now=$(date "+%Y-%m-%d %H:%M:%S")
    mode=$1
    msg=$2
    echo -e "${now} [${mode}]: ${msg}"
}

main "$@"
