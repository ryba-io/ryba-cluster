# /usr/local/bin/iojs node_modules/ryba/bin/capacity -c ./conf/cluster.coffee -c ./conf/uid_gid.coffee -c ./conf/capacity.coffee -c ./conf/user.coffee -o ./conf/capacity.coffee -w -p /data/1,/data/2

module.exports = 'nodes':
  'master1.ryba': 'config': 'ryba':
    'hdfs':
      'nn': 'site': 'dfs.namenode.name.dir': [ 'file:///var/hdfs/name' ]
      'site': 'dfs.replication': 2
    'yarn':
      'rm': 'site':
        'yarn.scheduler.minimum-allocation-mb': 256
        'yarn.scheduler.maximum-allocation-mb': 1024
        'yarn.scheduler.minimum-allocation-vcores': 1
        'yarn.scheduler.maximum-allocation-vcores': 3
      'capacity_scheduler': 'yarn.scheduler.capacity.resource-calculator': 'org.apache.hadoop.yarn.util.resource.DominantResourceCalculator'
    'mapred': 'site':
      'yarn.app.mapreduce.am.resource.mb': 128
      'yarn.app.mapreduce.am.command-opts': '-Xmx102m'
      'mapreduce.map.memory.mb': '256'
      'mapreduce.reduce.memory.mb': '512'
      'mapreduce.map.java.opts': '-Xmx204m'
      'mapreduce.reduce.java.opts': '-Xmx409m'
      'mapreduce.task.io.sort.mb': '102'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'tez': 'site':
      'tez.am.resource.memory.mb': 128
      'tez.task.resource.memory.mb': '256'
      'tez.runtime.io.sort.mb': '102'
    'kafka': 'broker': 'log.dirs': [
      '/data/1/kafka'
      '/data/2/kafka'
    ]
  'master2.ryba': 'config': 'ryba':
    'hdfs':
      'nn': 'site': 'dfs.namenode.name.dir': [ 'file:///var/hdfs/name' ]
      'site': 'dfs.replication': 2
    'yarn':
      'rm': 'site':
        'yarn.scheduler.minimum-allocation-mb': 256
        'yarn.scheduler.maximum-allocation-mb': 1024
        'yarn.scheduler.minimum-allocation-vcores': 1
        'yarn.scheduler.maximum-allocation-vcores': 3
      'capacity_scheduler': 'yarn.scheduler.capacity.resource-calculator': 'org.apache.hadoop.yarn.util.resource.DominantResourceCalculator'
    'mapred': 'site':
      'yarn.app.mapreduce.am.resource.mb': 128
      'yarn.app.mapreduce.am.command-opts': '-Xmx102m'
      'mapreduce.map.memory.mb': '256'
      'mapreduce.reduce.memory.mb': '512'
      'mapreduce.map.java.opts': '-Xmx204m'
      'mapreduce.reduce.java.opts': '-Xmx409m'
      'mapreduce.task.io.sort.mb': '102'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'tez': 'site':
      'tez.am.resource.memory.mb': 128
      'tez.task.resource.memory.mb': '256'
      'tez.runtime.io.sort.mb': '102'
    'kafka': 'broker': 'log.dirs': [
      '/data/1/kafka'
      '/data/2/kafka'
    ]
  'master3.ryba': 'config': 'ryba':
    'hdfs': 'site': 'dfs.replication': 2
    'mapred': 'site':
      'yarn.app.mapreduce.am.resource.mb': 128
      'yarn.app.mapreduce.am.command-opts': '-Xmx102m'
      'mapreduce.map.memory.mb': '256'
      'mapreduce.reduce.memory.mb': '512'
      'mapreduce.map.java.opts': '-Xmx204m'
      'mapreduce.reduce.java.opts': '-Xmx409m'
      'mapreduce.task.io.sort.mb': '102'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'kafka': 'broker': 'log.dirs': [
      '/data/1/kafka'
      '/data/2/kafka'
    ]
  'front1.ryba': 'config': 'ryba':
    'hdfs': 'site': 'dfs.replication': 2
    'mapred': 'site':
      'yarn.app.mapreduce.am.resource.mb': 128
      'yarn.app.mapreduce.am.command-opts': '-Xmx102m'
      'mapreduce.map.memory.mb': '256'
      'mapreduce.reduce.memory.mb': '512'
      'mapreduce.map.java.opts': '-Xmx204m'
      'mapreduce.reduce.java.opts': '-Xmx409m'
      'mapreduce.task.io.sort.mb': '102'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'tez': 'site':
      'tez.am.resource.memory.mb': 128
      'tez.task.resource.memory.mb': '256'
      'tez.runtime.io.sort.mb': '102'
    'hive': 'site':
      'hive.tez.container.size': '256'
      'hive.tez.java.opts': '-Xmx204m'
  'worker1.ryba': 'config': 'ryba':
    'hdfs': 'site':
      'dfs.replication': 2
      'dfs.datanode.data.dir': [
        '/data/1/hdfs/data'
        '/data/2/hdfs/data'
      ]
    'yarn': 'site':
      'yarn.nodemanager.resource.percentage-physical-cpu-limit': '100'
      'yarn.nodemanager.resource.memory-mb': 1024
      'yarn.nodemanager.vmem-pmem-ratio': '2.1'
      'yarn.nodemanager.resource.cpu-vcores': 3
      'yarn.nodemanager.local-dirs': [
        '/data/1/yarn/local'
        '/data/2/yarn/local'
      ]
      'yarn.nodemanager.log-dirs': [
        '/data/1/yarn/log'
        '/data/2/yarn/log'
      ]
    'mapred': 'site':
      'yarn.app.mapreduce.am.resource.mb': 128
      'yarn.app.mapreduce.am.command-opts': '-Xmx102m'
      'mapreduce.map.memory.mb': '256'
      'mapreduce.reduce.memory.mb': '512'
      'mapreduce.map.java.opts': '-Xmx204m'
      'mapreduce.reduce.java.opts': '-Xmx409m'
      'mapreduce.task.io.sort.mb': '102'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'hbase': 'rs': 'heapsize': '128m'
    'nifi': 'config': 'properties':
      'nifi.content.repository.directory.cr1': '/data/1/nifi/content_repository'
      'nifi.content.repository.directory.cr2': '/data/2/nifi/content_repository'
      'nifi.provenance.repository.directory.pr1': '/data/1/nifi/provenance_repository'
      'nifi.provenance.repository.directory.pr2': '/data/2/nifi/provenance_repository'
  'worker2.ryba': 'config': 'ryba':
    'hdfs': 'site':
      'dfs.replication': 2
      'dfs.datanode.data.dir': [
        '/data/1/hdfs/data'
        '/data/2/hdfs/data'
      ]
    'yarn': 'site':
      'yarn.nodemanager.resource.percentage-physical-cpu-limit': '100'
      'yarn.nodemanager.resource.memory-mb': 1024
      'yarn.nodemanager.vmem-pmem-ratio': '2.1'
      'yarn.nodemanager.resource.cpu-vcores': 3
      'yarn.nodemanager.local-dirs': [
        '/data/1/yarn/local'
        '/data/2/yarn/local'
      ]
      'yarn.nodemanager.log-dirs': [
        '/data/1/yarn/log'
        '/data/2/yarn/log'
      ]
    'mapred': 'site':
      'yarn.app.mapreduce.am.resource.mb': 128
      'yarn.app.mapreduce.am.command-opts': '-Xmx102m'
      'mapreduce.map.memory.mb': '256'
      'mapreduce.reduce.memory.mb': '512'
      'mapreduce.map.java.opts': '-Xmx204m'
      'mapreduce.reduce.java.opts': '-Xmx409m'
      'mapreduce.task.io.sort.mb': '102'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'hbase': 'rs': 'heapsize': '128m'
    'nifi': 'config': 'properties':
      'nifi.content.repository.directory.cr1': '/data/1/nifi/content_repository'
      'nifi.content.repository.directory.cr2': '/data/2/nifi/content_repository'
      'nifi.provenance.repository.directory.pr1': '/data/1/nifi/provenance_repository'
      'nifi.provenance.repository.directory.pr2': '/data/2/nifi/provenance_repository'

# master1.ryba
#   Number of core: 1
#   Number of partitions: 2
#   Memory Total: 1.219 GB
#   Memory System: 0 B

# master2.ryba
#   Number of core: 1
#   Number of partitions: 2
#   Memory Total: 1.219 GB
#   Memory System: 0 B

# master3.ryba
#   Number of core: 1
#   Number of partitions: 2
#   Memory Total: 1.711 GB
#   Memory System: 0 B

# front1.ryba
#   Number of core: 1
#   Number of partitions: 2
#   Memory Total: 490.18 MB
#   Memory System: 0 B

# worker1.ryba
#   Number of core: 3
#   Number of partitions: 2
#   Memory Total: 1.711 GB
#   Memory System: 343.879 MB
#   HBase RegionServer
#     Memory HBase: 128 MB
#   YARN NodeManager
#     Memory YARN: 1.25 GB
#     Number of Cores: 3
#     Number of Containers: 4
#     Memory per Containers: 256 MB

# worker2.ryba
#   Number of core: 3
#   Number of partitions: 2
#   Memory Total: 1.711 GB
#   Memory System: 343.879 MB
#   HBase RegionServer
#     Memory HBase: 128 MB
#   YARN NodeManager
#     Memory YARN: 1.25 GB
#     Number of Cores: 3
#     Number of Containers: 4
#     Memory per Containers: 256 MB
