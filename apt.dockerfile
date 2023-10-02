FROM ubuntu/nginx

VOLUME apt_repo_volume 

RUN apt update -y &&  \
    apt install aptly -y

COPY ./config/.aptly.conf /root/

RUN aptly mirror create ubuntu-jammy http://archive.ubuntu.com/ubuntu jammy main
RUN aptly mirror update ubuntu-jammy

RUN aptly snapshot create localrepo from mirror ubuntu-jammy && \
    aptly publish snapshot -distribution jammy -architectures="amd64" localrepo

CMD aptly serve
