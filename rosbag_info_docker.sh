#!/bin/bash
bag_path=$1
shift

docker run \
       --net host \
       -it --rm \
       -v $(realpath $bag_path):/tmp/bag.bag \
       ros:noetic \
       rosbag info /tmp/bag.bag
