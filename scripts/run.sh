#! /bin/bash

data_dir=${1}
if [ -z ${data_dir} ]; then
    data_dir=${PWD}/data
fi

xhost +local:docker

docker run --gpus all -it -v ${data_dir}:/ws/data \
    -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
    --entrypoint=zsh docker_cpp_env:latest
    