#!/bin/bash
USAGE0=$(cat <<-END
     utils


END
)


##########################################################################
function exists_in_list() {
    # https://www.baeldung.com/linux/check-variable-exists-in-list
    # list1="banana,pear,apple,strawberry,lime"
    # if exists "pear"   "$list1" ","; then
    #     echo "pear is in the list"
    # else
    #     echo "pear is not in the list"
    # fi    

    VALUE=$1
    LIST=$2
    DELIMITER=$3  &&  [ -z $3 ] &&    DELIMITER=","

    echo $LIST | tr "$DELIMITER" '\n' | grep -F -q -x "$VALUE"
}

alias exists=exists_in_list



