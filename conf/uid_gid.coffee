
module.exports =
  services:
    'masson/core/sssd':
      config: ryba: sssd:
        group: gid: 2452
        user: uid: 2452, gid: 2452
    'masson/core/bind_server':
      config: bind_server:
        user: uid: 802, gid: 802
        group: gid: 802
    'masson/core/openldap_server':
      config:
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
      config: saslauthd:
        group: gid: 2456
        user: uid: 2456, gid: 2456
    'masson/commons/docker': 
      config: docker:
        group: gid: 2457
        group_dockerroot: gid: 2458
        user_dockerroot: uid: 2458, gid: 2458
    'masson/commons/mariadb/server':
      config: ryba: mariadb:
        group: gid: 2445
        user: uid: 2445, gid: 2445
    'masson/commons/mysql/server':
      config: ryba: mysql:
        group: gid: 2445
        user: uid: 2445, gid: 2445
    'masson/commons/postgres/server':
      config: ryba: postgres:
        group: gid: 2446
        user: uid: 2446, gid: 2446
    'masson/commons/httpd':
      config: httpd:
        user: uid: 2416, gid: 2416
        group: gid: 2416
    'ryba/zookeeper/server':
      config: ryba: zookeeper:
        group: gid: 2402
        hadoop_group: gid: 2400
        user: uid: 2402, gid: 2402
    'ryba/ambari/server':
      config: ryba: ambari_server:
        group: gid: 2408
        user: uid: 2408, gid: 2408
    'ryba/hadoop/core':
      config: ryba:
        hadoop_group: gid: 2400
        group: gid: 2414
        user: uid: 2414, gid: 2414
        hdfs:
          group: gid: 2401
          user: uid: 2401, gid: 2401
        yarn:
          group: gid: 2403
          user: uid: 2403, gid: 2403
        mapred:
          group: gid: 2404
          user: uid: 2404, gid: 2404
    'ryba/hadoop/httpfs':
      config: ryba: httpfs:
        group: gid: 2427
        user: uid: 2427, gid: 2427
    'ryba/flume':
      config: ryba: flume:
        group: gid: 2405
        user: uid: 2405, gid: 2405
    'ryba/retired/ganglia/collector':
      config: ryba: ganglia:
        rrdcached_group: gid: 2406
        rrdcached_user: uid: 2406, gid: 2406
    'ryba/retired/nagios':
      config: ryba: nagios:
        group: gid: 2418
        groupcmd: gid: 2419
        user: uid: 2418, gid: 2418
    'ryba/hadoop/kms':
      config: ryba: kms:
        group: gid: 2453
        user: uid: 2453, gid: 2453
    'ryba/hive/hcatalog':
      config: ryba: hive:
        group: gid: 2407
        user: uid: 2407, gid: 2407
    'ryba/hbase/master':
      config: ryba: hbase: master:
        group: gid: 2409
        user: uid: 2409, gid: 2409
    'ryba/hue':
      config: ryba: hue:
        group: gid: 2410
        user: uid: 2410, gid: 2410
    'ryba/oozie/server':
      config: ryba: oozie:
        group: gid: 2411
        user: uid: 2411, gid: 2411
    'ryba/sqoop':
      config: ryba: sqoop:
        group: gid: 2412
        user: uid: 2412, gid: 2400
    'ryba/knox':
      config: ryba: knox:
        group: gid: 2420
        user: uid: 2420, gid: 2420
    'ryba/retired/falcon/server':
      config: ryba: falcon:
        group: gid: 2421
        user: uid: 2421, gid: 2421
    'ryba/elasticsearch':
      config: ryba: elasticsearch:
        group: gid: 2422
        user: uid: 2422, gid: 2422
    'ryba/rexster':
      config: ryba: rexster:
        group: gid: 2423
        user: uid: 2423, gid: 2423
    'ryba/kafka/broker':
      config: ryba: kafka:
        group: gid: 2424
        user: uid: 2424, gid: 2424
    'ryba/spark/client':
      config: ryba: spark:
        group: gid: 2426
        user: uid: 2426, gid: 2426
    'ryba/spark/history_server':
      config: ryba: spark:
        group: gid: 2426
        user: uid: 2426, gid: 2426
    'ryba/spark/livy_server':
      config: ryba: spark:
        group: gid: 2426
        user: uid: 2426, gid: 2426
    'ryba/opentsdb':
      config: ryba: opentsdb:
        group: gid: 2428
        user: uid: 2428, gid: 2428
    'ryba/mongodb/configsrv':
      config: ryba: mongodb:
        group: gid: 2429
        user: uid: 2429, gid: 2429
    'ryba/nifi':
      config: ryba: nifi:
        group: gid: 2431
        user: uid: 2431, gid: 2431
    'ryba/solr/cloud':
      config: ryba: solr:
        group: gid: 2432
        user: uid: 2432, gid: 2432
    'ryba/ranger/admin':
      config: ryba: ranger:
        group: gid: 2434
        user: uid: 2434, gid: 2434
    'ryba/druid/base':
      config: ryba: druid:
        group: gid: 2435
        user: uid: 2435, gid: 2435
    'ryba/smartsense/server':
      config: ryba: smartsense:
        group: gid: 2436
        user: uid: 2436, gid: 2436
    'ryba/atlas':
      config: ryba: atlas:
        group: gid: 2437
        user: uid: 2437, gid: 2437
    'ryba/zeppelin':
      config: ryba: zeppelin:
        group: gid: 2438
        user: uid: 2438, gid: 2438
    'ryba/spark/livy_server':
      config: ryba: livy:
        group: gid: 2439
        user: uid: 2439, gid: 2439
    'ryba/phoenix/queryserver':
      config: ryba: phoenix:
        group: gid: 2441
        user: uid: 2441, gid: 2441
    'ryba/tez':
      config: ryba: tez:
        group: gid: 2447
        user: uid: 2447, gid: 2447

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
