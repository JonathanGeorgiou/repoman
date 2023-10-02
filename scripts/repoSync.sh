#!/bin/bash
echo "Changing directory to yum repo volume"
cd /yum_repo_volume

echo "Starting download of BaseOS repository"
dnf reposync --download-metadata -m --delete --remote-time --repoid=baseos

echo "Download complete!"
du -sh /yum_repo_volume
