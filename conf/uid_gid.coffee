
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
    group: gid: 2414
    user: uid: 2414, gid: 2414
    zookeeper:
      group: gid: 2402
      user: uid: 2402, gid: 2400
    hdfs:
      group: gid: 2401
      user: uid: 2401, gid: 2401
    httpfs:
      group: gid: 2427
      user: uid: 2427, gid: 2427
    yarn:
      group: gid: 2403
      user: uid: 2403, gid: 2403
    mapred:
      group: gid: 2404
      user: uid: 2404, gid: 2404
    flume:
      group: gid: 2405
      user: uid: 2405, gid: 2405
    hive:
      group: gid: 2407
      user: uid: 2407, gid: 2407
    hue:
      group: gid: 2410
      user: uid: 2410, gid: 2410
    # webhcat:
    #   group: gid: 2407
    #   user: uid: 2407, gid: 2407
    hbase:
      group: gid: 2409
      user: uid: 2409, gid: 2409
    oozie:
      group: gid: 2411
      user: uid: 2411, gid: 2411
    sqoop:
      user: uid: 2412, gid: 2400
    pig:
      user: uid: 2413, gid: 2400
    ganglia:
      rrdcached_group: gid: 2406
      rrdcached_user: uid: 2406, gid: 2406
    falcon:
      group: gid: 2421
      user: uid: 2421, gid: 2421
    mongodb:
      group: gid: 2429
      user: uid: 2429, gid: 2429
    nagios:
      group: gid: 2418
      groupcmd: gid: 2419
      user: uid: 2418, gid: 2418
    knox:
      group: gid: 2420
      user: uid: 2420, gid: 2420
    kafka:
      group: gid: 2424
      user: uid: 2424, gid: 2424
    elasticsearch:
      group: gid: 2422
      user: uid: 2422, gid: 2422
    rexster:
      group: gid: 2423
      user: uid: 2423, gid: 2423
    presto:
      group: gid: 2425
      user: uid: 2425, gid: 2425
    spark:
      group: gid: 2426
      user: uid: 2426, gid: 2426
    httpfs:
      group: gid: 2427
      user: uid: 2427, gid: 2427
    opentsdb:
      group: gid: 2428
      user: uid: 2428, gid: 2428
  xasecure:
    group: gid: 2417
    user: uid: 2417, gid: 2417
  
