FROM williamyeh/ansible:ubuntu16.04
MAINTAINER René Oelke <r.oelke@toocan.biz>

RUN rm -fv /etc/ansible/hosts
COPY hosts.py /etc/ansible/hosts

ENV ANSIBLE_RETRY_FILES_ENABLED False
ENV ANSIBLE_HOSTS_DOMAIN suitepad.deploy

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y apt-utils python-dnspython && \
    rm -rf /var/lib/apt/lists/*
