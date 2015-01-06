# Hadoop Core 240*
# Hadoop Tools 240*
# Hadoop Supervision 242*
# Hadoop Security 243*

module.exports =
  bind_server:
    user: uid: 802, gid: 802
    group: gid: 802
  openldap_server:
    proxy_user:
      uidNumber: 801
      gidNumber: 801
    proxy_group:
      gidNumber: 801
  openldap_server_krb5:
    krbadmin_user:
      uidNumber: 800
      gidNumber: 800
    krbadmin_group:
      gidNumber: 800
  httpd:
    user: uid: 2416, gid: 2416
    group: gid: 2416
  ryba:
    hadoop_group: gid: 2400
    zookeeper_group: gid: 2401
    zookeeper_user: uid: 2401, gid: 2400
    hdfs_group: gid: 2402
    hdfs_user: uid: 2402, gid: 2402
    yarn:
      group: gid: 2403
      user: uid: 2403, gid: 2403
    test_group: gid: 2404
    test_user: uid: 2404, gid: 2404
    mapred_group: gid: 2405
    mapred_user: uid: 2405, gid: 2405
    flume_group: gid: 2405
    flume_user: uid: 2405, gid: 2405
    hbase_group: gid: 2410
    hbase_user: uid: 2410, gid: 2410
    hive_group: gid: 2411
    hive_user: uid: 2411, gid: 2411
    oozie:
      group: gid: 2412
      user: uid: 2412, gid: 2412
    hue:
      group: gid: 2410
      user: uid: 2410, gid: 2410
    sqoop_user: uid: 2412, gid: 2400
    pig_user: uid: 2413, gid: 2400
    falcon:
      group: gid: 2423
      user: uid: 2423, gid: 2423
    ganglia:
      rrdcached_group: gid: 2420
      rrdcached_user: uid: 2420, gid: 2420
    nagios:
      group: gid: 2421
      groupcmd: gid: 2422
      user: uid: 2421, gid: 2421
  knox:
    group: gid: 2430
    user: uid: 2430, gid: 2430
  xasecure:
    group: gid: 2431
    user: uid: 2431, gid: 2431
  