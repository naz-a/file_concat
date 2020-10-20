#!/bin/bash

param_index=1;
skip_param_index=0;
output_comment_string="";

add_param_index=0;

for param in $@;
do
    next_param_index=$(($param_index+1))
    if [[ $param_index -ne $skip_param_index ]]; then
        if [[ "-if" ==  $param ]]; then
            if [[ -n ${!next_param_index} ]]; then
                file_list_name=${!next_param_index}
                skip_param_index=$next_param_index
            fi
        elif [[ "-of" == $param ]];then
            if [[ -n ${!next_param_index} ]]; then
                output_file_name=${!next_param_index}
                skip_param_index=$next_param_index
            fi
        elif [[ "-cmt" == $param ]];then
            if [[ -n ${!next_param_index} ]]; then
                output_comment_string=${!next_param_index}
                skip_param_index=$next_param_index
            fi
        else
            file_list[$add_param_index]=$param;
            add_param_index=$(($add_param_index+1));
        fi
    fi
    param_index=$next_param_index
done;

if [[ -n $output_file_name ]]; then
    echo > "$output_file_name";
fi;

if [[ -n $file_list_name &&  -f $file_list_name ]]; then
    read_index=0;
    file_list=();
    while read line;
    do
        file_list[$read_index]="$line";
        read_index=$(($read_index+1));
    done < $file_list_name;
fi;

for item in ${file_list[@]};
do
    if [[ -f $item ]]; then
        if [[ -f $output_file_name ]]; then
            if [[ -n $output_comment_string ]]; then
                echo $output_comment_string >> $output_file_name
                echo $output_comment_string " " $item >> $output_file_name
                echo $output_comment_string >> $output_file_name
            fi;
           cat $item >> "$output_file_name";
           echo >> "$output_file_name";
           echo >> "$output_file_name";
        else
            if [[ -n $output_comment_string ]]; then
                echo $output_comment_string 
                echo $output_comment_string " " $item
                echo $output_comment_string
            fi;
            cat $item;
            echo;
            echo;
        fi;
    fi;
done;

