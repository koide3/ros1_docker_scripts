#!/bin/bash
script_dir=$(dirname ${BASH_SOURCE:-$0})
docker build --tag ros_noetic_rviz -f $script_dir/docker/Dockerfile.ros1_rviz $script_dir/docker

if [ $# -ne 0 ] ; then
  mount_args="-v $(realpath $1):/tmp/rviz.rviz"
  run_args="rviz -d /tmp/rviz.rviz"
else
  mount_args=""
  run_args="rviz"
fi

docker run \
       -it --rm \
       --net host \
       --gpus all \
       -e DISPLAY=$DISPLAY \
       -v $HOME/.Xauthority:/root/.Xauthority \
       $mount_args \
       ros_noetic_rviz $run_args
