FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y build-essential cmake \
    libboost-all-dev libeigen3-dev libgflags-dev libgoogle-glog-dev gdb\
    libgtest-dev libopencv-dev libprotobuf-dev libssl-dev \
    python3 python3-pip \
    pybind11-dev protobuf-compiler python3-dev python3-numpy \
    git wget vim tmux tree curl aptitude \
    libatlas-base-dev libsuitesparse-dev

# https://github.com/deluan/zsh-in-docker
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
    -p git -p ssh-agent -p 'history-substring-search' \
    -a 'bindkey "\$terminfo[kcuu1]" history-substring-search-up' \
    -a 'bindkey "\$terminfo[kcud1]" history-substring-search-down' \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-syntax-highlighting \
    -p 'jump'

# create a working directory within docker image: "ws"
RUN mkdir -p /ws
WORKDIR /ws
