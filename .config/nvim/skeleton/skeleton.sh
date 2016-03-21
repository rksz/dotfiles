#!/bin/sh
set -ue -o pipefail
export LC_ALL=C

main() {
    basepath=$(cd `dirname $0`; pwd)
}
main "$@"
