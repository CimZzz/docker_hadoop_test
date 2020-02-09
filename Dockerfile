from ancestor

MAINTAINER CimZzz "1152564696@qq.com" 

ADD config/core-site.xml /usr/local/hadoop/etc/hadoop/
ADD config/hdfs-site.xml /usr/local/hadoop/etc/hadoop/
ADD config/mapred-site.xml /usr/local/hadoop/etc/hadoop/
ADD config/yarn-site.xml /usr/local/hadoop/etc/hadoop/
ADD config/hadoop-env.sh /usr/local/hadoop/etc/hadoop/
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
ENV HADOOP_HOME=/usr/local/hadoop
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$JAVA_HOME/bin
ENV ROOT_USER cc
ENV ROOT_PASS dd

RUN mkdir /usr/local/docker
ADD config/dockersh.sh /usr/local/docker/
ADD config/ssh-key /usr/local/docker/ssh-key/
RUN chmod 777 /usr/local/docker/dockersh.sh
RUN chmod +x /etc/rc.d/rc.local
RUN echo /usr/local/docker/dockersh.sh >> /etc/rc.d/rc.local
#docker run -d --privileged -ti -v /sys/fs/cgroup:/sys/fs/cgroup --name cluster-master -h cluster-master -p 18088:18088 -p 9870:9870 --net netgroup --ip 172.18.0.2 cimzzz/hadoop_test /usr/sbin/init
#cluster-slaves
#docker run -d --privileged -ti -v /sys/fs/cgroup:/sys/fs/cgroup --name cluster-slave1 -h cluster-slave1 --net netgroup --ip 172.18.0.3 cimzzz/hadoop_test /usr/sbin/init
#docker run -d --privileged -ti -v /sys/fs/cgroup:/sys/fs/cgroup --name cluster-slave2 -h cluster-slave2 --net netgroup --ip 172.18.0.4 cimzzz/hadoop_test /usr/sbin/init
#docker run -d --privileged -ti -v /sys/fs/cgroup:/sys/fs/cgroup --name cluster-slave3 -h cluster-slave3 --net netgroup --ip 172.18.0.5 cimzzz/hadoop_test /usr/sbin/init