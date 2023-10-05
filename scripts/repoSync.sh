#!/bin/bash
echo "Changing directory to yum repo volume"
cd /tmp/dnf

echo "Starting download of BaseOS repository"
dnf reposync --download-metadata -m --delete --remote-time --repoid=plus

echo "Download complete!"
du -sh .
