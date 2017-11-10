
module.exports =
  clusters: 'vagrant': services:
    'masson/core/sssd':
      options:
        group: gid: 2452
        user: uid: 2452, gid: 2452
    'masson/core/bind_server':
      options:
        user: uid: 802, gid: 802
        group: gid: 802
    'masson/core/openldap_server':
      options:
        openldap_server:
          user: uid: 803, gid: 803
          group: gid: 803
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
    'masson/core/saslauthd':
      options:
        group: gid: 2456
        user: uid: 2456, gid: 2456
    'masson/commons/docker':
      options:
        group: gid: 2457
        group_dockerroot: gid: 2458
        user_dockerroot: uid: 2458, gid: 2458
    'masson/commons/mariadb/server':
      options:
        group: gid: 2445
        user: uid: 2445, gid: 2445
    # 'masson/commons/mysql/server':
    #   options:
    #     group: gid: 2445
    #     user: uid: 2445, gid: 2445
    # 'masson/commons/postgres/server':
    #   options:
    #     group: gid: 2446
    #     user: uid: 2446, gid: 2446
    'masson/commons/httpd':
      options:
        user: uid: 2416, gid: 2416
        group: gid: 2416
    # 'ryba/zookeeper/server':
    #   options:
    #     group: gid: 2402
    #     hadoop_group: gid: 2400
    #     user: uid: 2402, gid: 2402
    # 'ryba/ambari/server':
    #   options:
    #     group: gid: 2408
    #     user: uid: 2408, gid: 2408
    # 'ryba/hadoop/core':
    #   options:
    #     hadoop_group: gid: 2400
    #     group: gid: 2414
    #     user: uid: 2414, gid: 2414
    #     hdfs:
    #       group: gid: 2401
    #       user: uid: 2401, gid: 2401
    #     yarn:
    #       group: gid: 2403
    #       user: uid: 2403, gid: 2403
    #     mapred:
    #       group: gid: 2404
    #       user: uid: 2404, gid: 2404
    # 'ryba/hadoop/httpfs':
    #   options:
    #     group: gid: 2427
    #     user: uid: 2427, gid: 2427
    # 'ryba/flume':
    #   options:
    #     group: gid: 2405
    #     user: uid: 2405, gid: 2405
    # 'ryba/retired/ganglia/collector':
    #   options:
    #     rrdcached_group: gid: 2406
    #     rrdcached_user: uid: 2406, gid: 2406
    # 'ryba/retired/nagios':
    #   options:
    #     group: gid: 2418
    #     groupcmd: gid: 2419
    #     user: uid: 2418, gid: 2418
    # 'ryba/hadoop/kms':
    #   options:
    #     group: gid: 2453
    #     user: uid: 2453, gid: 2453
    # 'ryba/hive/hcatalog':
    #   options:
    #     group: gid: 2407
    #     user: uid: 2407, gid: 2407
    # 'ryba/hbase/master':
    #   options:
    #     group: gid: 2409
    #     user: uid: 2409, gid: 2409
    # 'ryba/huedocker':
    #   options:
    #     group: gid: 2410
    #     user: uid: 2410, gid: 2410
    # 'ryba/oozie/server':
    #   options:
    #     group: gid: 2411
    #     user: uid: 2411, gid: 2411
    # 'ryba/sqoop':
    #   options:
    #     group: gid: 2412
    #     user: uid: 2412, gid: 2400
    # 'ryba/knox/server':
    #   options:
    #     group: gid: 2420
    #     user: uid: 2420, gid: 2420
    # 'ryba/retired/falcon/server':
    #   options:
    #     group: gid: 2421
    #     user: uid: 2421, gid: 2421
    # 'ryba/elasticsearch':
    #   options:
    #     group: gid: 2422
    #     user: uid: 2422, gid: 2422
    # 'ryba/rexster':
    #   options:
    #     group: gid: 2423
    #     user: uid: 2423, gid: 2423
    # 'ryba/kafka/broker':
    #   options:
    #     group: gid: 2424
    #     user: uid: 2424, gid: 2424
    # 'ryba/spark/client':
    #   options:
    #     group: gid: 2426
    #     user: uid: 2426, gid: 2426
    # 'ryba/spark/history_server':
    #   options:
    #     group: gid: 2426
    #     user: uid: 2426, gid: 2426
    # 'ryba/spark/livy_server':
    #   options:
    #     group: gid: 2426
    #     user: uid: 2426, gid: 2426
    # 'ryba/opentsdb':
    #   options:
    #     group: gid: 2428
    #     user: uid: 2428, gid: 2428
    # 'ryba/mongodb/configsrv':
    #   options:
    #     group: gid: 2429
    #     user: uid: 2429, gid: 2429
    # 'ryba/nifi':
    #   options:
    #     group: gid: 2431
    #     user: uid: 2431, gid: 2431
    # 'ryba/solr/cloud':
    #   options:
    #     group: gid: 2432
    #     user: uid: 2432, gid: 2432
    # 'ryba/ranger/admin':
    #   options:
    #     group: gid: 2434
    #     user: uid: 2434, gid: 2434
    # 'ryba/druid/base':
    #   options:
    #     group: gid: 2435
    #     user: uid: 2435, gid: 2435
    # 'ryba/smartsense/server':
    #   options:
    #     group: gid: 2436
    #     user: uid: 2436, gid: 2436
    # 'ryba/atlas':
    #   options:
    #     group: gid: 2437
    #     user: uid: 2437, gid: 2437
    # 'ryba/zeppelin':
    #   options:
    #     group: gid: 2438
    #     user: uid: 2438, gid: 2438
    # 'ryba/spark/livy_server':
    #   options:
    #     group: gid: 2439
    #     user: uid: 2439, gid: 2439
    # 'ryba/phoenix/queryserver':
    #   options:
    #     group: gid: 2441
    #     user: uid: 2441, gid: 2441
    # 'ryba/tez':
    #   options:
    #     group: gid: 2447
    #     user: uid: 2447, gid: 2447
    # 'ryba/prometheus/monitor':
    #   options:
    #     group: gid: 2459
    #     user: uid: 2459, gid: 2459
    # 'ryba/grafana/webui':
    #   options:
    #     group: gid: 2460
    #     user: uid: 2460, gid: 2460

###

## Other users and groups

nfsnobody: uid: 2454, gid: 2454
apache: uid: 2455, gid: 2455
presto: uid: 2425, gid: 2425
cloudera: uid: 2440, gid: 2440
ams (ambari): uid: 2442, gid: 2442
infra-solr (ambari): uid: 2443, gid: 2443
ambari-qa: uid: 2448, gid: 2448
activity_analyzer: uid: 2449, gid: 2449
slider: uid: 2450, gid: 2450
hcat: uid: 2444, gid: 2444
logsearch: uid: 2451, gid: 2451
hawq: uid: 2433, gid: 2433

###
