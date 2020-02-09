#!/bin/bash
cat >>/etc/hosts<<EOF
127.0.0.1   localhost
172.18.0.2  cluster-master
172.18.0.3  cluster-slave1
172.18.0.4  cluster-slave2
172.18.0.5  cluster-slave3
EOF

if [[ -a "/usr/local/docker/ssh-key/$(hostname)" ]];then
    mv "/usr/local/docker/ssh-key/$(hostname)" /root/.ssh
else
    mv /usr/local/docker/ssh-key/cluster-master /root/.ssh/authorized_keys
fi
