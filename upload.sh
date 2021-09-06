
#!/bin/bash

function ergodic(){
    for file in ` ls $1`
        do
            if [ -d $1"/"$file ]
            then
                ergodic $1"/"$file
            else
                local path=$1"/$file" #得到文件的完整的目录
                local name=$file       #得到文件的名字
                #做自己的工作.
                # cd $1
                # echo ${path:6};
                curl_cmd="curl http://10.14.128.20:8000/resource/magellan_test/weiya-solider/${path:6} -X POST -F filecontent=@$1/$name"
                eval $curl_cmd
        fi
    done
}
INIT_PATH="./"
ergodic $INIT_PATH
