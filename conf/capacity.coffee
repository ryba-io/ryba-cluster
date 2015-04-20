# node node_modules/ryba/bin/capacity -c ./conf -o ./conf/capacity.coffee -w -p /data/1,/data/2

module.exports = 'servers':
  'master1.ryba': 'ryba': 'hdfs': 'site': 'dfs.namenode.name.dir': [ '/var/hdfs/name' ]
  'master2.ryba': 'ryba':
    'hdfs': 'site': 'dfs.namenode.name.dir': [ '/var/hdfs/name' ]
    'yarn':
      'site':
        'yarn.scheduler.minimum-allocation-mb': 512
        'yarn.scheduler.maximum-allocation-mb': 1536
        'yarn.scheduler.minimum-allocation-vcores': 1
        'yarn.scheduler.maximum-allocation-vcores': 2
      'capacity_scheduler': 'yarn.scheduler.capacity.resource-calculator': 'org.apache.hadoop.yarn.util.resource.DominantResourceCalculator'
  'master3.ryba': 'ryba':
    'mapred': 'site':
      'yarn.app.mapreduce.am.resource.mb': 512
      'yarn.app.mapreduce.am.command-opts': '-Xmx409m'
      'mapreduce.map.memory.mb': '512'
      'mapreduce.reduce.memory.mb': '1024'
      'mapreduce.map.java.opts': '-Xmx409m'
      'mapreduce.reduce.java.opts': '-Xmx819m'
      'mapreduce.task.io.sort.mb': '204'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'hive': 'site':
      'hive.tez.container.size': '512'
      'hive.tez.java.opts': '-Xmx409m'
  'front1.ryba': 'ryba':
    'mapred': 'site':
      'yarn.app.mapreduce.am.resource.mb': 512
      'yarn.app.mapreduce.am.command-opts': '-Xmx409m'
      'mapreduce.map.memory.mb': '512'
      'mapreduce.reduce.memory.mb': '1024'
      'mapreduce.map.java.opts': '-Xmx409m'
      'mapreduce.reduce.java.opts': '-Xmx819m'
      'mapreduce.task.io.sort.mb': '204'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'hive': 'site':
      'hive.tez.container.size': '512'
      'hive.tez.java.opts': '-Xmx409m'
  'worker1.ryba': 'ryba':
    'hdfs': 'site': 'dfs.datanode.data.dir': [
      '/data/1/hdfs/data'
      '/data/2/hdfs/data'
    ]
    'yarn': 'site':
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
    'mapred': 'site':
      'yarn.app.mapreduce.am.resource.mb': 512
      'yarn.app.mapreduce.am.command-opts': '-Xmx409m'
      'mapreduce.map.memory.mb': '512'
      'mapreduce.reduce.memory.mb': '1024'
      'mapreduce.map.java.opts': '-Xmx409m'
      'mapreduce.reduce.java.opts': '-Xmx819m'
      'mapreduce.task.io.sort.mb': '204'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'hbase': 'regionserver_opts': '-Xmx128m'
  'worker2.ryba': 'ryba':
    'hdfs': 'site': 'dfs.datanode.data.dir': [
      '/data/1/hdfs/data'
      '/data/2/hdfs/data'
    ]
    'yarn': 'site':
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
    'mapred': 'site':
      'yarn.app.mapreduce.am.resource.mb': 512
      'yarn.app.mapreduce.am.command-opts': '-Xmx409m'
      'mapreduce.map.memory.mb': '512'
      'mapreduce.reduce.memory.mb': '1024'
      'mapreduce.map.java.opts': '-Xmx409m'
      'mapreduce.reduce.java.opts': '-Xmx819m'
      'mapreduce.task.io.sort.mb': '204'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'hbase': 'regionserver_opts': '-Xmx128m'

# master1.ryba
#   Number of core: 1
#   Number of partitions: 2
#   Memory Total: 1.096 GB
#   Memory System: 0 B

# master2.ryba
#   Number of core: 1
#   Number of partitions: 2
#   Memory Total: 1.096 GB
#   Memory System: 0 B

# master3.ryba
#   Number of core: 1
#   Number of partitions: 2
#   Memory Total: 1.096 GB
#   Memory System: 0 B

# front1.ryba
#   Number of core: 1
#   Number of partitions: 2
#   Memory Total: 490.445 MB
#   Memory System: 0 B

# worker1.ryba
#   Number of core: 2
#   Number of partitions: 2
#   Memory Total: 1.833 GB
#   Memory System: 213.266 MB
#   HBase RegionServer
#     Memory HBase: 128 MB
#   YARN NodeManager
#     Memory YARN: 1.5 GB
#     Number of Cores: 2
#     Number of Containers: 3
#     Memory per Containers: 512 MB

# worker2.ryba
#   Number of core: 2
#   Number of partitions: 2
#   Memory Total: 1.833 GB
#   Memory System: 213.266 MB
#   HBase RegionServer
#     Memory HBase: 128 MB
#   YARN NodeManager
#     Memory YARN: 1.5 GB
#     Number of Cores: 2
#     Number of Containers: 3
#     Memory per Containers: 512 MB
