#!/bin/bash
#
# @rksz
#
#########################################

readonly BASEPATH=$(cd `dirname $0`; pwd)
readonly CMDNAME=$(basename $0)

usage() {
    echo "usage: $CMDNAME" 1>&2
}

main() {
    if [ $# -lt 1 ]; then
        usage
        exit 1
    fi


}

main "$@"
