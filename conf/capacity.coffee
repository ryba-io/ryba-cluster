# /usr/bin/node node_modules/ryba/bin/capacity -c ./conf/config.coffee -c ./conf/uid_gid.coffee -c ./conf/user.coffee -c ./conf/config.coffee -c ./conf/uid_gid.coffee -c ./conf/user.coffee -c ./conf/config.coffee -c ./conf/uid_gid.coffee -c ./conf/capacity.coffee -c ./conf/user.coffee -o ./conf/capacity.coffee -w -p /data/1,/data/2

module.exports = 'nodes':
  'master01.metal.ryba': 'services':
    'vagrant:ryba/hadoop/hdfs_nn': 'hdfs_site': 'dfs.namenode.name.dir': [ 'file:///var/hdfs/name' ]
    'vagrant:ryba/hadoop/hdfs_client': 'hdfs_site': 'dfs.replication': 3
    'vagrant:ryba/hadoop/yarn_rm':
      'yarn_site':
        'yarn.scheduler.minimum-allocation-mb': 256
        'yarn.scheduler.maximum-allocation-mb': 1280
        'yarn.scheduler.minimum-allocation-vcores': 1
        'yarn.scheduler.maximum-allocation-vcores': 2
      'capacity_scheduler': 'yarn.scheduler.capacity.resource-calculator': 'org.apache.hadoop.yarn.util.resource.DominantResourceCalculator'
    'vagrant:ryba/hadoop/mapred_client': 'mapred_site':
      'mapreduce.map.memory.mb': '256'
      'mapreduce.reduce.memory.mb': '512'
      'yarn.app.mapreduce.am.resource.mb': 512
      'yarn.app.mapreduce.am.command-opts': '-Xmx409m'
      'mapreduce.map.java.opts': '-Xmx204m'
      'mapreduce.reduce.java.opts': '-Xmx409m'
      'mapreduce.task.io.sort.mb': '102'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'vagrant:ryba/tez': 'tez_site':
      'tez.am.resource.memory.mb': 512
      'tez.task.resource.memory.mb': '256'
      'tez.runtime.io.sort.mb': '102'
    'vagrant:ryba/kafka/broker': 'config': 'log.dirs': [
      '/data/1/kafka'
      '/data/2/kafka'
    ]
  'master02.metal.ryba': 'services':
    'vagrant:ryba/hadoop/hdfs_nn': 'hdfs_site': 'dfs.namenode.name.dir': [ 'file:///var/hdfs/name' ]
    'vagrant:ryba/hadoop/hdfs_client': 'hdfs_site': 'dfs.replication': 3
    'vagrant:ryba/hadoop/yarn_rm':
      'yarn_site':
        'yarn.scheduler.minimum-allocation-mb': 256
        'yarn.scheduler.maximum-allocation-mb': 1280
        'yarn.scheduler.minimum-allocation-vcores': 1
        'yarn.scheduler.maximum-allocation-vcores': 2
      'capacity_scheduler': 'yarn.scheduler.capacity.resource-calculator': 'org.apache.hadoop.yarn.util.resource.DominantResourceCalculator'
    'vagrant:ryba/hadoop/mapred_client': 'mapred_site':
      'mapreduce.map.memory.mb': '256'
      'mapreduce.reduce.memory.mb': '512'
      'yarn.app.mapreduce.am.resource.mb': 512
      'yarn.app.mapreduce.am.command-opts': '-Xmx409m'
      'mapreduce.map.java.opts': '-Xmx204m'
      'mapreduce.reduce.java.opts': '-Xmx409m'
      'mapreduce.task.io.sort.mb': '102'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'vagrant:ryba/tez': 'tez_site':
      'tez.am.resource.memory.mb': 512
      'tez.task.resource.memory.mb': '256'
      'tez.runtime.io.sort.mb': '102'
    'vagrant:ryba/kafka/broker': 'config': 'log.dirs': [
      '/data/1/kafka'
      '/data/2/kafka'
    ]
  'master03.metal.ryba': 'services':
    'vagrant:ryba/hadoop/hdfs_client': 'hdfs_site': 'dfs.replication': 3
    'vagrant:ryba/hadoop/mapred_client': 'mapred_site':
      'mapreduce.map.memory.mb': '256'
      'mapreduce.reduce.memory.mb': '512'
      'yarn.app.mapreduce.am.resource.mb': 512
      'yarn.app.mapreduce.am.command-opts': '-Xmx409m'
      'mapreduce.map.java.opts': '-Xmx204m'
      'mapreduce.reduce.java.opts': '-Xmx409m'
      'mapreduce.task.io.sort.mb': '102'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'vagrant:ryba/tez': 'tez_site':
      'tez.am.resource.memory.mb': 512
      'tez.task.resource.memory.mb': '256'
      'tez.runtime.io.sort.mb': '102'
    'vagrant:ryba/hive/client': 'hive_site':
      'hive.tez.container.size': '256'
      'hive.tez.java.opts': '-Xmx204m'
    'vagrant:ryba/kafka/broker': 'config': 'log.dirs': [
      '/data/1/kafka'
      '/data/2/kafka'
    ]
  'edge01.metal.ryba': 'services':
    'vagrant:ryba/hadoop/hdfs_client': 'hdfs_site': 'dfs.replication': 3
    'vagrant:ryba/hadoop/mapred_client': 'mapred_site':
      'mapreduce.map.memory.mb': '256'
      'mapreduce.reduce.memory.mb': '512'
      'yarn.app.mapreduce.am.resource.mb': 512
      'yarn.app.mapreduce.am.command-opts': '-Xmx409m'
      'mapreduce.map.java.opts': '-Xmx204m'
      'mapreduce.reduce.java.opts': '-Xmx409m'
      'mapreduce.task.io.sort.mb': '102'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'vagrant:ryba/tez': 'tez_site':
      'tez.am.resource.memory.mb': 512
      'tez.task.resource.memory.mb': '256'
      'tez.runtime.io.sort.mb': '102'
    'vagrant:ryba/hive/client': 'hive_site':
      'hive.tez.container.size': '256'
      'hive.tez.java.opts': '-Xmx204m'
    'vagrant:ryba/hive/beeline': 'hive_site':
      'hive.tez.container.size': '256'
      'hive.tez.java.opts': '-Xmx204m'
  'worker01.metal.ryba': 'services':
    'vagrant:ryba/hadoop/hdfs_client': 'hdfs_site': 'dfs.replication': 3
    'vagrant:ryba/hadoop/hdfs_dn': 'hdfs_site': 'dfs.datanode.data.dir': [
      '/data/1/hdfs/data'
      '/data/2/hdfs/data'
    ]
    'vagrant:ryba/hadoop/yarn_nm': 'yarn_site':
      'yarn.nodemanager.resource.percentage-physical-cpu-limit': '100'
      'yarn.nodemanager.resource.memory-mb': 1280
      'yarn.nodemanager.vmem-pmem-ratio': '2.1'
      'yarn.nodemanager.resource.cpu-vcores': 2
      'yarn.nodemanager.local-dirs': [
        '/data/1/yarn/local'
        '/data/2/yarn/local'
      ]
      'yarn.nodemanager.log-dirs': [
        '/data/1/yarn/log'
        '/data/2/yarn/log'
      ]
    'vagrant:ryba/hadoop/mapred_client': 'mapred_site':
      'mapreduce.map.memory.mb': '256'
      'mapreduce.reduce.memory.mb': '512'
      'yarn.app.mapreduce.am.resource.mb': 512
      'yarn.app.mapreduce.am.command-opts': '-Xmx409m'
      'mapreduce.map.java.opts': '-Xmx204m'
      'mapreduce.reduce.java.opts': '-Xmx409m'
      'mapreduce.task.io.sort.mb': '102'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'vagrant:ryba/hbase/regionserver': 'heapsize': '384m'
  'worker02.metal.ryba': 'services':
    'vagrant:ryba/hadoop/hdfs_client': 'hdfs_site': 'dfs.replication': 3
    'vagrant:ryba/hadoop/hdfs_dn': 'hdfs_site': 'dfs.datanode.data.dir': [
      '/data/1/hdfs/data'
      '/data/2/hdfs/data'
    ]
    'vagrant:ryba/hadoop/yarn_nm': 'yarn_site':
      'yarn.nodemanager.resource.percentage-physical-cpu-limit': '100'
      'yarn.nodemanager.resource.memory-mb': 1280
      'yarn.nodemanager.vmem-pmem-ratio': '2.1'
      'yarn.nodemanager.resource.cpu-vcores': 2
      'yarn.nodemanager.local-dirs': [
        '/data/1/yarn/local'
        '/data/2/yarn/local'
      ]
      'yarn.nodemanager.log-dirs': [
        '/data/1/yarn/log'
        '/data/2/yarn/log'
      ]
    'vagrant:ryba/hadoop/mapred_client': 'mapred_site':
      'mapreduce.map.memory.mb': '256'
      'mapreduce.reduce.memory.mb': '512'
      'yarn.app.mapreduce.am.resource.mb': 512
      'yarn.app.mapreduce.am.command-opts': '-Xmx409m'
      'mapreduce.map.java.opts': '-Xmx204m'
      'mapreduce.reduce.java.opts': '-Xmx409m'
      'mapreduce.task.io.sort.mb': '102'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'vagrant:ryba/hbase/regionserver': 'heapsize': '384m'
  'worker03.metal.ryba': 'services':
    'vagrant:ryba/hadoop/hdfs_client': 'hdfs_site': 'dfs.replication': 3
    'vagrant:ryba/hadoop/hdfs_dn': 'hdfs_site': 'dfs.datanode.data.dir': [
      '/data/1/hdfs/data'
      '/data/2/hdfs/data'
    ]
    'vagrant:ryba/hadoop/yarn_nm': 'yarn_site':
      'yarn.nodemanager.resource.percentage-physical-cpu-limit': '100'
      'yarn.nodemanager.resource.memory-mb': 1280
      'yarn.nodemanager.vmem-pmem-ratio': '2.1'
      'yarn.nodemanager.resource.cpu-vcores': 2
      'yarn.nodemanager.local-dirs': [
        '/data/1/yarn/local'
        '/data/2/yarn/local'
      ]
      'yarn.nodemanager.log-dirs': [
        '/data/1/yarn/log'
        '/data/2/yarn/log'
      ]
    'vagrant:ryba/hadoop/mapred_client': 'mapred_site':
      'mapreduce.map.memory.mb': '256'
      'mapreduce.reduce.memory.mb': '512'
      'yarn.app.mapreduce.am.resource.mb': 512
      'yarn.app.mapreduce.am.command-opts': '-Xmx409m'
      'mapreduce.map.java.opts': '-Xmx204m'
      'mapreduce.reduce.java.opts': '-Xmx409m'
      'mapreduce.task.io.sort.mb': '102'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'vagrant:ryba/hbase/regionserver': 'heapsize': '384m'

# master01.metal.ryba
#   Number of core: 1
#   Number of partitions: 2
#   Memory Total: 3.702 GB
#   Memory System: 0 B

# master02.metal.ryba
#   Number of core: 1
#   Number of partitions: 2
#   Memory Total: 3.702 GB
#   Memory System: 0 B

# master03.metal.ryba
#   Number of core: 1
#   Number of partitions: 2
#   Memory Total: 1.698 GB
#   Memory System: 0 B

# edge01.metal.ryba
#   Number of core: 1
#   Number of partitions: 2
#   Memory Total: 1.797 GB
#   Memory System: 0 B

# worker01.metal.ryba
#   Number of core: 2
#   Number of partitions: 2
#   Memory Total: 2.289 GB
#   Memory System: 128 MB
#   HBase RegionServer
#     Memory HBase: 384 MB
#   YARN NodeManager
#     Memory YARN: 1.25 GB
#     Number of Cores: 2
#     Number of Containers: 4
#     Memory per Containers: 256 MB
#   YARN NodeManager Process heapsize: 256 MB
#   HDFS Datanode Process heapsize: 256 MB

# worker02.metal.ryba
#   Number of core: 2
#   Number of partitions: 2
#   Memory Total: 2.289 GB
#   Memory System: 128 MB
#   HBase RegionServer
#     Memory HBase: 384 MB
#   YARN NodeManager
#     Memory YARN: 1.25 GB
#     Number of Cores: 2
#     Number of Containers: 4
#     Memory per Containers: 256 MB
#   YARN NodeManager Process heapsize: 256 MB
#   HDFS Datanode Process heapsize: 256 MB

# worker03.metal.ryba
#   Number of core: 2
#   Number of partitions: 2
#   Memory Total: 2.289 GB
#   Memory System: 128 MB
#   HBase RegionServer
#     Memory HBase: 384 MB
#   YARN NodeManager
#     Memory YARN: 1.25 GB
#     Number of Cores: 2
#     Number of Containers: 4
#     Memory per Containers: 256 MB
#   YARN NodeManager Process heapsize: 256 MB
#   HDFS Datanode Process heapsize: 256 MB
