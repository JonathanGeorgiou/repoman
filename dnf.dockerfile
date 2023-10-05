FROM almalinux

RUN mkdir -p /tmp/dnf && mkdir -p /tmp/scripts

WORKDIR /tmp 

COPY ./scripts/repoSync.sh ./scripts
COPY ./scripts/createRepo.sh ./scripts
# # COPY ./yum.repos.d/proxy-repo.repo /etc/yum.repos.d/
#
RUN chmod +x scripts/repoSync.sh && chmod +x scripts/createRepo.sh

# Install and enable required software
# RUN rm -rf /etc/yum.repos.d/almalinux* && \
RUN  dnf clean all && \
     dnf update -y && \
     dnf install yum-utils createrepo -y

CMD ./scripts/repoSync.sh && ./scripts/createRepo.sh
