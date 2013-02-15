#!/bin/bash
#
#
#
#########################################


main() {

    #Definition
    readonly BASEPATH=$(cd `dirname $0`; pwd)
    readonly CMDNAME=$(basename $0)

    #Validation
    if [[ $# -lt 1 ]]; then
        echo "usage: $CMDNAME" 1>&2
        exit 1
    fi

    #Main

}

main "$@"
