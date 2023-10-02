FROM almalinux

VOLUME yum_repo_volume

WORKDIR / 

COPY ./scripts/repoSync.sh .
COPY ./scripts/createRepo.sh .
# COPY ./yum.repos.d/proxy-repo.repo /etc/yum.repos.d/

# Install and enable required software
# RUN rm -rf /etc/yum.repos.d/almalinux* && \
RUN  dnf clean all && \
  dnf update -y && \
  dnf install yum-utils createrepo httpd httpd-tools -y

# Enable http on firewall
# RUN firewall-cmd --zone=public --add-service=http --permanent && \
    # firewall-cmd --zone=public --add-service=http --permanent && \
    # firewall-cmd --reload

# Enable selinux for /var/www/html directory
# RUN chcon -R -t httpd_sys_rw_content_t /var/www/html
RUN chmod +x repoSync.sh && chmod +x createRepo.sh

CMD ./repoSync.sh && ./createRepo.sh && /usr/sbin/httpd
