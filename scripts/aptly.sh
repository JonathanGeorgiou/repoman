#!/bin/bash

echo "Beginning mirror creation"
aptly mirror create -filter='nginx' ubuntu-jammy http://archive.ubuntu.com/ubuntu jammy main
echo "Starting download"
aptly mirror update ubuntu-jammy
echo "Publishing debian repository to /tmp/.aptly/public"
aptly snapshot create localrepo from mirror ubuntu-jammy 
aptly publish snapshot -distribution jammy -architectures="amd64" localrepo
echo "Size of published repo:"
du -sh /tmp/.aptly/public


