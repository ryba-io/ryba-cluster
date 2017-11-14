# /usr/bin/node node_modules/ryba/bin/capacity -c ./conf/cluster.coffee -c ./conf/uid_gid.coffee -c ./conf/capacity.coffee -c ./conf/user.coffee -o ./conf/capacity.coffee -w -p /data/1,/data/2

module.exports = 'nodes':
  'master01.metal.ryba':
    services:
      'vagrant:ryba/hadoop/hdfs_nn':
        'hdfs_site': 'dfs.namenode.name.dir': [ 'file:///var/hdfs/name' ]
      'vagrant:ryba/hadoop/hdfs_client':
        'hdfs_site': 'dfs.replication': 2
      'vagrant:ryba/hadoop/yarn_rm':
        'yarn_site':
          'yarn.scheduler.minimum-allocation-mb': 384
          'yarn.scheduler.maximum-allocation-mb': 1536
          'yarn.scheduler.minimum-allocation-vcores': 1
          'yarn.scheduler.maximum-allocation-vcores': 2
        'capacity_scheduler': 'yarn.scheduler.capacity.resource-calculator': 'org.apache.hadoop.yarn.util.resource.DominantResourceCalculator'
      # 'vagrant:ryba/hadoop/mapred_client':
      #   'mapred_site':
      #     'yarn.app.mapreduce.am.resource.mb': 192
      #     'yarn.app.mapreduce.am.command-opts': '-Xmx153m'
      #     'mapreduce.map.memory.mb': '384'
      #     'mapreduce.reduce.memory.mb': '768'
      #     'mapreduce.map.java.opts': '-Xmx307m'
      #     'mapreduce.reduce.java.opts': '-Xmx614m'
      #     'mapreduce.task.io.sort.mb': '153'
      #     'mapreduce.map.cpu.vcores': 1
      #     'mapreduce.reduce.cpu.vcores': 1
      # 'vagrant:ryba/tez':
      #   'tez_site':
      #     'tez.am.resource.memory.mb': 192
      #     'tez.task.resource.memory.mb': '384'
      #     'tez.runtime.io.sort.mb': '153'
      # 'vagrant:ryba/kafka/broker':
      #   'log.dirs': [
      #     '/data/1/kafka'
      #     '/data/2/kafka'
      #   ]
  'master02.metal.ryba':
    services:
      'vagrant:ryba/hadoop/hdfs_nn':
        'hdfs_site': 'dfs.namenode.name.dir': [ 'file:///var/hdfs/name' ]
      'vagrant:ryba/hadoop/hdfs_client':
        'hdfs_site': 'dfs.replication': 2
      'vagrant:ryba/hadoop/yarn_rm':
        'yarn_site':
          'yarn.scheduler.minimum-allocation-mb': 384
          'yarn.scheduler.maximum-allocation-mb': 1536
          'yarn.scheduler.minimum-allocation-vcores': 1
          'yarn.scheduler.maximum-allocation-vcores': 2
        'capacity_scheduler': 'yarn.scheduler.capacity.resource-calculator': 'org.apache.hadoop.yarn.util.resource.DominantResourceCalculator'
      # 'vagrant:ryba/hadoop/mapred_client':
      #   'mapred_site':
      #     'yarn.app.mapreduce.am.resource.mb': 192
      #     'yarn.app.mapreduce.am.command-opts': '-Xmx153m'
      #     'mapreduce.map.memory.mb': '384'
      #     'mapreduce.reduce.memory.mb': '768'
      #     'mapreduce.map.java.opts': '-Xmx307m'
      #     'mapreduce.reduce.java.opts': '-Xmx614m'
      #     'mapreduce.task.io.sort.mb': '153'
      #     'mapreduce.map.cpu.vcores': 1
      #     'mapreduce.reduce.cpu.vcores': 1
      # 'vagrant:ryba/tez':
      #   'tez_site':
      #     'tez.am.resource.memory.mb': 192
      #     'tez.task.resource.memory.mb': '384'
      #     'tez.runtime.io.sort.mb': '153'
      # 'vagrant:ryba/kafka/broker':
      #   'log.dirs': [
      #     '/data/1/kafka'
      #     '/data/2/kafka'
      #   ]
  'master03.metal.ryba':
    services:
      'vagrant:ryba/hadoop/hdfs_client':
        'hdfs_site': 'dfs.replication': 2
      # 'vagrant:ryba/hadoop/mapred_client':
      #   'mapred_site':
      #     'yarn.app.mapreduce.am.resource.mb': 192
      #     'yarn.app.mapreduce.am.command-opts': '-Xmx153m'
      #     'mapreduce.map.memory.mb': '384'
      #     'mapreduce.reduce.memory.mb': '768'
      #     'mapreduce.map.java.opts': '-Xmx307m'
      #     'mapreduce.reduce.java.opts': '-Xmx614m'
      #     'mapreduce.task.io.sort.mb': '153'
      #     'mapreduce.map.cpu.vcores': 1
      #     'mapreduce.reduce.cpu.vcores': 1
      'vagrant:ryba/tez':
        'tez_site':
          'tez.am.resource.memory.mb': 192
          'tez.task.resource.memory.mb': '384'
          'tez.runtime.io.sort.mb': '153'
      # 'vagrant:ryba/kafka/broker':
      #   'log.dirs': [
      #     '/data/1/kafka'
      #     '/data/2/kafka'
      #   ]
  'edge01.metal.ryba':
    services:
      'vagrant:ryba/hadoop/hdfs_client':
        'hdfs_site': 'dfs.replication': 2
      'vagrant:ryba/hadoop/mapred_client':
        'mapred_site':
          'yarn.app.mapreduce.am.resource.mb': 192
          'yarn.app.mapreduce.am.command-opts': '-Xmx153m'
          'mapreduce.map.memory.mb': '384'
          'mapreduce.reduce.memory.mb': '768'
          'mapreduce.map.java.opts': '-Xmx307m'
          'mapreduce.reduce.java.opts': '-Xmx614m'
          'mapreduce.task.io.sort.mb': '153'
          'mapreduce.map.cpu.vcores': 1
          'mapreduce.reduce.cpu.vcores': 1
      'vagrant:ryba/tez':
        'tez_site':
          'tez.am.resource.memory.mb': 192
          'tez.task.resource.memory.mb': '384'
          'tez.runtime.io.sort.mb': '153'
      # 'vagrant:ryba/hive/client':
      #   'hive': 'hive_site':
      #     'hive.tez.container.size': '384'
      #     'hive.tez.java.opts': '-Xmx307m'
  'worker01.metal.ryba':
    services:
      # 'vagrant:ryba/hadoop/hdfs_client':
      #   'hdfs_site': 'dfs.replication': 2
      'vagrant:ryba/hadoop/hdfs_dn':
        'hdfs_site':
          'dfs.datanode.data.dir': [
            '/data/1/hdfs/data'
            '/data/2/hdfs/data'
          ]
      'vagrant:ryba/hadoop/yarn_nm':
        'yarn_site':
          'yarn.nodemanager.resource.percentage-physical-cpu-limit': '100'
          'yarn.nodemanager.resource.memory-mb': 1536
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
      # 'vagrant:ryba/hadoop/mapred_client':
      #   'mapred_site':
      #     'yarn.app.mapreduce.am.resource.mb': 192
      #     'yarn.app.mapreduce.am.command-opts': '-Xmx153m'
      #     'mapreduce.map.memory.mb': '384'
      #     'mapreduce.reduce.memory.mb': '768'
      #     'mapreduce.map.java.opts': '-Xmx307m'
      #     'mapreduce.reduce.java.opts': '-Xmx614m'
      #     'mapreduce.task.io.sort.mb': '153'
      #     'mapreduce.map.cpu.vcores': 1
      #     'mapreduce.reduce.cpu.vcores': 1
      'vagrant:ryba/hbase/regionserver':
        'heapsize': '128m'
      # 'vagrant:ryba/nifi':
      #   'config': 'properties':
      #     'nifi.content.repository.directory.cr1': '/data/1/nifi/content_repository'
      #     'nifi.content.repository.directory.cr2': '/data/2/nifi/content_repository'
      #     'nifi.provenance.repository.directory.pr1': '/data/1/nifi/provenance_repository'
      #     'nifi.provenance.repository.directory.pr2': '/data/2/nifi/provenance_repository'
  'worker02.metal.ryba':
    services:
      # 'vagrant:ryba/hadoop/hdfs_client':
      #   'hdfs_site': 'dfs.replication': 2
      'vagrant:ryba/hadoop/hdfs_dn':
        'hdfs_site':
          'dfs.datanode.data.dir': [
            '/data/1/hdfs/data'
            '/data/2/hdfs/data'
          ]
      'vagrant:ryba/hadoop/yarn_nm':
        'yarn_site':
          'yarn.nodemanager.resource.percentage-physical-cpu-limit': '100'
          'yarn.nodemanager.resource.memory-mb': 1536
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
      # 'vagrant:ryba/hadoop/mapred_client':
      #   'mapred_site':
      #     'yarn.app.mapreduce.am.resource.mb': 192
      #     'yarn.app.mapreduce.am.command-opts': '-Xmx153m'
      #     'mapreduce.map.memory.mb': '384'
      #     'mapreduce.reduce.memory.mb': '768'
      #     'mapreduce.map.java.opts': '-Xmx307m'
      #     'mapreduce.reduce.java.opts': '-Xmx614m'
      #     'mapreduce.task.io.sort.mb': '153'
      #     'mapreduce.map.cpu.vcores': 1
      #     'mapreduce.reduce.cpu.vcores': 1
      'vagrant:ryba/hbase/regionserver':
        'heapsize': '128m'
      # 'vagrant:ryba/nifi':
      #   'config': 'properties':
      #     'nifi.content.repository.directory.cr1': '/data/1/nifi/content_repository'
      #     'nifi.content.repository.directory.cr2': '/data/2/nifi/content_repository'
      #     'nifi.provenance.repository.directory.pr1': '/data/1/nifi/provenance_repository'
      #     'nifi.provenance.repository.directory.pr2': '/data/2/nifi/provenance_repository'
  'worker03.metal.ryba':
    services:
      # 'vagrant:ryba/hadoop/hdfs_client':
      #   'hdfs_site': 'dfs.replication': 2
      'vagrant:ryba/hadoop/hdfs_dn':
        'hdfs_site':
          'dfs.datanode.data.dir': [
            '/data/1/hdfs/data'
            '/data/2/hdfs/data'
          ]
      'vagrant:ryba/hadoop/yarn_nm':
        'yarn_site':
          'yarn.nodemanager.resource.percentage-physical-cpu-limit': '100'
          'yarn.nodemanager.resource.memory-mb': 1536
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
      # 'vagrant:ryba/hadoop/mapred_client':
      #   'mapred_site':
      #     'yarn.app.mapreduce.am.resource.mb': 192
      #     'yarn.app.mapreduce.am.command-opts': '-Xmx153m'
      #     'mapreduce.map.memory.mb': '384'
      #     'mapreduce.reduce.memory.mb': '768'
      #     'mapreduce.map.java.opts': '-Xmx307m'
      #     'mapreduce.reduce.java.opts': '-Xmx614m'
      #     'mapreduce.task.io.sort.mb': '153'
      #     'mapreduce.map.cpu.vcores': 1
      #     'mapreduce.reduce.cpu.vcores': 1
      'vagrant:ryba/hbase/regionserver':
        'heapsize': '128m'
      # 'vagrant:ryba/nifi':
      #   'config': 'properties':
      #     'nifi.content.repository.directory.cr1': '/data/1/nifi/content_repository'
      #     'nifi.content.repository.directory.cr2': '/data/2/nifi/content_repository'
      #     'nifi.provenance.repository.directory.pr1': '/data/1/nifi/provenance_repository'
      #     'nifi.provenance.repository.directory.pr2': '/data/2/nifi/provenance_repository'

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
#   Memory Total: 1.708 GB
#   Memory System: 0 B

# edge01.metal.ryba
#   Number of core: 1
#   Number of partitions: 2
#   Memory Total: 488.668 MB
#   Memory System: 0 B

# worker01.metal.ryba
#   Number of core: 2
#   Number of partitions: 2
#   Memory Total: 1.796 GB
#   Memory System: 175.523 MB
#   HBase RegionServer
#     Memory HBase: 128 MB
#   YARN NodeManager
#     Memory YARN: 1.5 GB
#     Number of Cores: 2
#     Number of Containers: 4
#     Memory per Containers: 384 MB

# worker02.metal.ryba
#   Number of core: 2
#   Number of partitions: 2
#   Memory Total: 1.796 GB
#   Memory System: 175.523 MB
#   HBase RegionServer
#     Memory HBase: 128 MB
#   YARN NodeManager
#     Memory YARN: 1.5 GB
#     Number of Cores: 2
#     Number of Containers: 4
#     Memory per Containers: 384 MB
