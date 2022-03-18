#!/bin/bash
filename="result.csv"
dir=`dirname "$0"`
export OMP_PLACES=cores

run() {
    echo "testcase: $1"
    for tn in 2 4 8 16
    do
        $dir/build/benchmark --keys_file=$dir/resources/$1 --read=0.5 --insert=0.5 --operations_num=200000000 --table_size=-1 --init_table_ratio=0.5 --thread_num=$tn --output_path=$dir/${filename} $2
    done
    echo
}

if [ "$1" = "1" ]; then
    run libio
elif [ "$1" = "2" ]; then
    run osm
elif [ "$1" = "3" ]; then
    run genome
fi