ref https://www.linode.com/docs/databases/hadoop/how-to-install-and-set-up-hadoop-cluster/

## for all node
1. config /etc/host (docker service name),**@must** remove localhost for namenode
2. add ssh,make sure name node can access datanode without password
3. set java home in  hadoop_env.sh
4. set hadoop_home in  hadoop_env.sh
5. set user in hadoop_env.sh
```
export HDFS_DATANODE_USER=root
export HDFS_SECONDARYNAMENODE_USER=root
export YARN_RESOURCEMANAGER_USER=root
export YARN_NODEMANAGER_USER=root to hadoop_env.sh
```
6. config core-site.xml **@important**

```xml
    <configuration>
        <property>
            <name>fs.default.name</name>
            <value>hdfs://{node-master-host_name}:9000</value>
        </property>
    </configuration>
```
7. config hdfs-site.conf **@important**
```xml
<configuration>
    <property>
            <name>dfs.namenode.name.dir</name>
            <value>/home/hadoop/data/nameNode</value>
    </property>

    <property>
            <name>dfs.datanode.data.dir</name>
            <value>/home/hadoop/data/dataNode</value>
    </property>

    <property>
            <name>dfs.replication</name>
            <value>2</value>
    </property>
</configuration>

```

## for name node
1. make namenode data dir: /data/hadoop/hdfs/nameNode match with hdfs-site
2. config workers, in hadoop_home/etc/hadoop/workers,add host name for datanode

## for  data node
1. make data dir: /data/hadoop/hdfs/dataNode ,match with hdfs-site
