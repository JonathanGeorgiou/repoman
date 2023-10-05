FROM ubuntu

WORKDIR /tmp
RUN mkdir -p /tmp/.aptly/public
RUN apt update -y &&  \
    apt install aptly -y

COPY ./config/aptly.conf /etc/
COPY ./scripts/aptly.sh .

RUN chmod +x aptly.sh

CMD ./aptly.sh
