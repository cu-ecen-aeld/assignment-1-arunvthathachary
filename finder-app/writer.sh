#!/bin/bash
# bash script to create new file (if needed) in given path and write given string to file
# Author: Arun V Thathachary

#### check num args
if [[ $# -ne 2 ]]
then
    echo "Error. Requires 2 parameters: filepath, string"
    exit 1
else
    writefile="$1"
    writestr="$2"
    #echo "$writefile"
    #echo "$writestr"
    #### check if file exists
    if [[ ! -e $1 ]]
    then
        #### separate dir path and file name from full path
        dirpath="$(dirname $writefile )"
        file="$(basename $writefile )"
        #dirpath=$( echo ${writefile%/*} )
        #file=$( echo ${writefile##*/} )
        #echo "$dirpath"
        #echo "$file"
        ### if no directory exists make one
        if [ ! -d $dirpath ]
        then
            mkdir "$dirpath"
        fi
        cd $dirpath
        touch $1
        echo "new file $file created"
    else
        echo "file already exists"
    fi
    echo $writestr >> $writefile #$(cat $writefile)$writestr > $writefile
    exit 0                                      
fi 