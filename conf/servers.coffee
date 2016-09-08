
module.exports =
  servers:
    'master1.ryba':
      ip: '10.10.10.11'
      modules: [
        'masson/bootstrap/log'
        'masson/bootstrap/connection'
        # Commons
        'masson/core/locale'
        'masson/core/network'
        # 'masson/core/network_check'
        'masson/core/users'
        'masson/core/ssh'
        'masson/core/ntp'
        'masson/core/proxy'
        'masson/core/yum'
        'masson/commons/java'
        # Security
        'masson/core/security'
        'masson/core/iptables'
        'masson/core/krb5_server'
        'masson/core/sssd'
        # Hadoop
        # 'ryba/ambari/agent'
        'ryba/zookeeper/server'
        'ryba/hadoop/hdfs_jn'
        'ryba/hadoop/hdfs_nn'
        'ryba/hadoop/zkfc'
        'ryba/hadoop/httpfs'
        'ryba/hadoop/yarn_rm'
        'ryba/phoenix/master'
        'ryba/hbase/master'
        'ryba/kafka/broker'
        'ryba/druid/broker'
        #'ryba/mongodb/configsrv'
        #'ryba/mongodb/shard'
        # 'ryba/xasecure/hdfs'
        'ryba/ganglia/monitor'
      ]
      ryba:
        # designates a primary for the config servers replica set
        mongo_config_replica_master: true
        # designates a primary for the sharding servers replica set
        mongo_shard_replica_master: true
        # active_nn: true
        ssl:
          'cert': "#{__dirname}/certs/master1_cert.pem"
          'key': "#{__dirname}/certs/master1_key.pem"
        druid: broker: jvm:
            xms: '128m'
            xmx: '512m'
      krb5:
        etc_krb5_conf:
          realms:
            'HADOOP.RYBA':
              kadmin_principal: 'wdavidw/admin@HADOOP.RYBA'
              kadmin_password: 'test'
              principals: [
                principal: 'krbtgt/HADOOP.RYBA@USERS.RYBA'
                password: 'test'
              ]
        kdc_conf:
          dbmodules:
            'openldap_master3':
              kdc_master_key: 'test'
    'master2.ryba':
      ip: '10.10.10.12'
      modules: [
        'masson/bootstrap/log'
        'masson/bootstrap/connection'
        # Commons
        'masson/core/network'
        'masson/core/locale'
        # 'masson/core/network_check'
        'masson/core/users'
        'masson/core/ssh'
        'masson/core/ntp'
        'masson/core/proxy'
        'masson/core/yum'
        'masson/commons/java'
        'masson/commons/docker'
        'masson/commons/postgres/server'
        # Security
        'masson/core/security'
        'masson/core/iptables'
        # 'masson/core/openldap_server'
        # 'masson/core/openldap_server/install_krb5'
        'masson/core/krb5_client'
        'masson/core/sssd'
        # Hadoop
        # 'ryba/ambari/agent'
        'ryba/zookeeper/server'
        'ryba/hadoop/hdfs_jn'
        'ryba/hadoop/hdfs_nn'
        'ryba/hadoop/zkfc'
        'ryba/hadoop/httpfs'
        'ryba/hadoop/yarn_rm'
        'ryba/phoenix/master'
        'ryba/hbase/master'
        'ryba/hive/hcatalog'
        'ryba/hive/server2'
        'ryba/kafka/broker'
        'ryba/druid/broker'
        #'ryba/mongodb/configsrv'
        #'ryba/mongodb/router'
        # 'ryba/xasecure/hdfs'
        'ryba/ganglia/monitor'
      ]
      ryba:
        ssl:
          'cert': "#{__dirname}/certs/master2_cert.pem"
          'key': "#{__dirname}/certs/master2_key.pem"
        druid: broker: jvm:
            xms: '128m'
            xmx: '512m'
      openldap_server:
        tls_cert_file: "#{__dirname}/certs/master2_cert.pem"
        tls_key_file: "#{__dirname}/certs/master2_key.pem"
    'master3.ryba':
      ip: '10.10.10.13'
      modules: [
        'masson/bootstrap/log'
        'masson/bootstrap/connection'
        # 'masson/core/bind_server'
        # Commons
        'masson/core/network'
        'masson/core/locale'
        # 'masson/core/network_check'
        'masson/core/users'
        'masson/core/ssh'
        'masson/core/ntp'
        'masson/core/proxy'
        'masson/core/yum'
        'masson/commons/java'
        # # Security
        'masson/core/security'
        'masson/core/iptables'
        'masson/core/openldap_server'
        'masson/core/openldap_server/install_krb5'
        'masson/core/openldap_client'
        'masson/commons/phpldapadmin'
        'masson/core/krb5_server'
        'masson/core/sssd'
        'masson/commons/docker'
        'masson/commons/httpd'
        # Hadoop
        'masson/commons/mysql/server'
        # 'ryba/xasecure/policymgr'
        # 'ryba/xasecure/uxugsync'
        # 'ryba/ambari/server'
        # 'ryba/ambari/agent'
        'ryba/zookeeper/server'
        'ryba/hadoop/hdfs_jn'
        'ryba/hadoop/httpfs'
        'ryba/hadoop/yarn_ts'
        'ryba/hadoop/mapred_jhs'
        'ryba/hive/hcatalog'
        'ryba/hive/server2'
        'ryba/hive/webhcat'
        'ryba/hbase/rest'
        'ryba/oozie/server'
        'ryba/elasticsearch'
        'ryba/titan'
        'ryba/rexster'
        'ryba/kafka/broker'
        'ryba/druid/broker'
        'ryba/druid/tranquility'
        'ryba/hue'
        # 'ryba/xasecure/hive'
        'ryba/opentsdb'
        'ryba/ganglia/collector'
        'ryba/ganglia/monitor'
        'ryba/nagios'
        #'ryba/mongodb/configsrv'
        #'ryba/mongodb/router'
      ]
      ryba:
        mongo_router_for_configsrv: 'configsrvRepSet1'
        ssl:
          'cert': "#{__dirname}/certs/master3_cert.pem"
          'key': "#{__dirname}/certs/master3_key.pem"
        druid: broker: jvm:
            xms: '128m'
            xmx: '512m'
      krb5:
        etc_krb5_conf:
          libdefaults:
            default_realm: 'HADOOP.RYBA'
          realms:
            'USERS.RYBA':
              kadmin_principal: 'users/admin@USERS.RYBA'
              kadmin_password: 'test'
              principals: [
                principal: 'krbtgt/HADOOP.RYBA@USERS.RYBA'
                password: 'test'
              ]
        kdc_conf:
          dbmodules:
            'openldap_master3': 
              kdc_master_key: 'test'
    'front1.ryba':
      ip: '10.10.10.14'
      modules: [
        'masson/bootstrap/log'
        'masson/bootstrap/connection'
        # Commons
        'masson/core/network'
        'masson/core/locale'
        # 'masson/core/network_check'
        'masson/core/users'
        'masson/core/ssh'
        'masson/core/locale'
        'masson/core/ntp'
        'masson/core/proxy'
        'masson/core/yum'
        'masson/commons/java'
        'masson/commons/maven'
        'masson/commons/git'
        # Security
        'masson/core/security'
        'masson/core/iptables'
        'masson/core/krb5_client'
        'masson/core/sssd'
        # Hadoop
        # 'ryba/ambari/agent'
        'ryba/zookeeper/client'
        'ryba/hadoop/hdfs_client'
        'ryba/hadoop/yarn_client'
        'ryba/hadoop/mapred_client'
        'ryba/tez'
        'ryba/spark/client'
        'ryba/hbase/client'
        'ryba/phoenix/client'
        'ryba/pig'
        'ryba/hive/client'
        'ryba/oozie/client'
        'ryba/sqoop'
        'ryba/flume'
        'ryba/mahout'
        'ryba/falcon/server'
        'ryba/falcon/client'
        'ryba/kafka/consumer'
        'ryba/kafka/producer'
        'ryba/ganglia/monitor'
        #'ryba/mongodb/client'
      ]
      ryba:
        ssl:
          'cert': "#{__dirname}/certs/front1_cert.pem"
          'key': "#{__dirname}/certs/front1_key.pem"
    'worker1.ryba':
      ip: '10.10.10.16'
      modules: [
        'masson/bootstrap/log'
        'masson/bootstrap/connection'
        # Commons
        'masson/core/network'
        # 'masson/core/network_check'
        'masson/core/users'
        'masson/core/ssh'
        'masson/core/ntp'
        'masson/core/proxy'
        'masson/core/yum'
        'masson/commons/java'
        # Security
        'masson/core/security'
        'masson/core/iptables'
        'masson/core/krb5_client'
        'masson/core/sssd'
        # Hadoop
        # 'ryba/ambari/agent'
        'ryba/hadoop/hdfs_dn'
        'ryba/hadoop/yarn_nm'
        'ryba/hadoop/mapred_client'
        'ryba/flume'
        'ryba/phoenix/regionserver'
        'ryba/hbase/regionserver'
        'ryba/druid/coordinator'
        'ryba/druid/overlord'
        'ryba/druid/historical'
        'ryba/druid/middlemanager'
        'ryba/ganglia/monitor'
        #'ryba/mongodb/shard'
      ]
      ryba:
        rack: 1
        ssl:
          'cert': "#{__dirname}/certs/worker1_cert.pem"
          'key': "#{__dirname}/certs/worker1_key.pem"
    'worker2.ryba':
      ip: '10.10.10.17'
      modules: [
        'masson/bootstrap/log'
        'masson/bootstrap/connection'
        # Commons
        'masson/core/network'
        'masson/core/locale'
        # 'masson/core/network_check'
        'masson/core/users'
        'masson/core/ssh'
        'masson/core/ntp'
        'masson/core/proxy'
        'masson/core/yum'
        'masson/commons/java'
        # Security
        'masson/core/security'
        'masson/core/iptables'
        'masson/core/krb5_client'
        'masson/core/sssd'
        # Hadoop
        # 'ryba/ambari/agent'
        'ryba/hadoop/hdfs_dn'
        'ryba/hadoop/yarn_nm'
        'ryba/hadoop/mapred_client'
        'ryba/flume'
        'ryba/phoenix/regionserver'
        'ryba/hbase/regionserver'
        'ryba/druid/coordinator'
        'ryba/druid/overlord'
        'ryba/druid/historical'
        'ryba/druid/middlemanager'
        #'ryba/mongodb/shard'
        # 'ryba/presto'
        'ryba/ganglia/monitor'
      ]
      ryba:
        rack: 2
        ssl:
          'cert': "#{__dirname}/certs/worker2_cert.pem"
          'key': "#{__dirname}/certs/worker2_key.pem"
