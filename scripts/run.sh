#! /bin/bash

data_dir=${1}
if [ -z ${data_dir} ]; then
    data_dir=${PWD}/data
fi

docker run -it -v ${data_dir}:/ws/data --entrypoint=zsh docker_cpp_env:latest
