# node node_modules/ryba/bin/capacity -c ./conf -o ./conf/capacity.coffee -w

module.exports = 'servers':
  'master1.ryba': 'ryba': 'hdfs': 'site': 'dfs.namenode.name.dir': [ '/var/hdfs/name' ]
  'master2.ryba': 'ryba':
    'hdfs': 'site': 'dfs.namenode.name.dir': [ '/var/hdfs/name' ]
    'yarn':
      'site':
        'yarn.scheduler.minimum-allocation-mb': 640
        'yarn.scheduler.maximum-allocation-mb': 1280
        'yarn.scheduler.minimum-allocation-vcores': 1
        'yarn.scheduler.maximum-allocation-vcores': 2
      'capacity_scheduler': 'yarn.scheduler.capacity.resource-calculator': 'org.apache.hadoop.yarn.util.resource.DominantResourceCalculator'
  'master3.ryba': 'ryba':
    'mapred': 'site':
      'yarn.app.mapreduce.am.resource.mb': 640
      'yarn.app.mapreduce.am.command-opts': '-Xmx1024m'
      'mapreduce.map.memory.mb': '640'
      'mapreduce.reduce.memory.mb': '1280'
      'mapreduce.map.java.opts': '-Xmx512m'
      'mapreduce.reduce.java.opts': '-Xmx1024m'
      'mapreduce.task.io.sort.mb': '256'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'hive': 'site':
      'hive.tez.container.size': '640'
      'hive.tez.java.opts': '-Xmx512m'
  'front1.ryba': 'ryba':
    'mapred': 'site':
      'yarn.app.mapreduce.am.resource.mb': 640
      'yarn.app.mapreduce.am.command-opts': '-Xmx1024m'
      'mapreduce.map.memory.mb': '640'
      'mapreduce.reduce.memory.mb': '1280'
      'mapreduce.map.java.opts': '-Xmx512m'
      'mapreduce.reduce.java.opts': '-Xmx1024m'
      'mapreduce.task.io.sort.mb': '256'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'hive': 'site':
      'hive.tez.container.size': '640'
      'hive.tez.java.opts': '-Xmx512m'
  'worker1.ryba': 'ryba':
    'hdfs': 'site': 'dfs.datanode.data.dir': [
      '/data/1/hdfs/data'
      '/data/2/hdfs/data'
    ]
    'yarn': 'site':
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
    'mapred': 'site':
      'yarn.app.mapreduce.am.resource.mb': 640
      'yarn.app.mapreduce.am.command-opts': '-Xmx1024m'
      'mapreduce.map.memory.mb': '640'
      'mapreduce.reduce.memory.mb': '1280'
      'mapreduce.map.java.opts': '-Xmx512m'
      'mapreduce.reduce.java.opts': '-Xmx1024m'
      'mapreduce.task.io.sort.mb': '256'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'hbase': 'regionserver_opts': '-Xmx384m'
  'worker2.ryba': 'ryba':
    'hdfs': 'site': 'dfs.datanode.data.dir': [
      '/data/1/hdfs/data'
      '/data/2/hdfs/data'
    ]
    'yarn': 'site':
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
    'mapred': 'site':
      'yarn.app.mapreduce.am.resource.mb': 640
      'yarn.app.mapreduce.am.command-opts': '-Xmx1024m'
      'mapreduce.map.memory.mb': '640'
      'mapreduce.reduce.memory.mb': '1280'
      'mapreduce.map.java.opts': '-Xmx512m'
      'mapreduce.reduce.java.opts': '-Xmx1024m'
      'mapreduce.task.io.sort.mb': '256'
      'mapreduce.map.cpu.vcores': 1
      'mapreduce.reduce.cpu.vcores': 1
    'hbase': 'regionserver_opts': '-Xmx384m'