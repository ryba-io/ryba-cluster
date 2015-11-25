
module.exports =
  servers:
    'master1.ryba':
      ip: '10.10.10.11'
      modules: [
        'masson/core/reload'
        # Commons
        'masson/core/network'
        'masson/core/network_check'
        'masson/core/users'
        'masson/core/ssh'
        'masson/core/ntp'
        'masson/core/proxy'
        'masson/core/yum'
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
        # 'ryba/xasecure/hdfs'
        'ryba/ganglia/monitor'
      ]
      ryba:
        active_nn: true
        ssl:
          'cert': "#{__dirname}/certs/master1_cert.pem"
          'key': "#{__dirname}/certs/master1_key.pem"
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
        'masson/core/reload'
        # Commons
        'masson/core/network'
        'masson/core/network_check'
        'masson/core/users'
        'masson/core/ssh'
        'masson/core/ntp'
        'masson/core/proxy'
        'masson/core/yum'
        # Security
        'masson/core/security'
        'masson/core/iptables'
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
        'ryba/hbase/master'
        'ryba/hive/hcatalog'
        'ryba/hive/server2'
        'ryba/kafka/broker'
        # 'ryba/xasecure/hdfs'
        'ryba/ganglia/monitor'
      ]
      ryba:
        ssl:
          'cert': "#{__dirname}/certs/master2_cert.pem"
          'key': "#{__dirname}/certs/master2_key.pem"
    'master3.ryba':
      ip: '10.10.10.13'
      modules: [
        'masson/core/reload'
        # Bind, Commons, OpenLDAP and KRB5
        'masson/core/bind_server'
        # Commons
        'masson/core/network'
        'masson/core/network_check'
        'masson/core/users'
        'masson/core/ssh'
        'masson/core/ntp'
        'masson/core/proxy'
        'masson/core/yum'
        # Security
        'masson/core/security'
        'masson/core/iptables'
        'masson/core/openldap_server'
        'masson/core/openldap_server/install_tls'
        'masson/core/openldap_server/install_acl'
        'masson/core/openldap_server/install_krb5'
        'masson/core/openldap_client'
        'masson/commons/phpldapadmin'
        'masson/core/krb5_server'
        'masson/core/sssd'
        'masson/commons/docker'
        # Hadoop
        'masson/commons/mysql_server'
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
        'ryba/rexster'
        'ryba/kafka/broker'
        'ryba/hue'
        # 'ryba/xasecure/hive'
        'ryba/ganglia/collector'
        'ryba/ganglia/monitor'
        'ryba/nagios'
      ]
      ryba:
        ssl:
          'cert': "#{__dirname}/certs/master3_cert.pem"
          'key': "#{__dirname}/certs/master3_key.pem"
      krb5:
        etc_krb5_conf:
          libdefaults:
            default_realm: 'HADOOP.RYBA'
          realms:
            'USERS.RYBA':
              kadmin_principal: 'wdavidw/admin@USERS.RYBA'
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
        'masson/core/reload'
        # Commons
        'masson/core/network'
        'masson/core/network_check'
        'masson/core/users'
        'masson/core/ssh'
        'masson/core/ntp'
        'masson/core/proxy'
        'masson/core/yum'
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
        'ryba/falcon'
        'ryba/kafka/consumer'
        'ryba/kafka/producer'
        'ryba/ganglia/monitor'
      ]
      ryba:
        ssl:
          'cert': "#{__dirname}/certs/front1_cert.pem"
          'key': "#{__dirname}/certs/front1_key.pem"
    'worker1.ryba':
      ip: '10.10.10.16'
      modules: [
        'masson/core/reload'
        # Commons
        'masson/core/network'
        'masson/core/network_check'
        'masson/core/users'
        'masson/core/ssh'
        'masson/core/ntp'
        'masson/core/proxy'
        'masson/core/yum'
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
        'ryba/ganglia/monitor'
      ]
      ryba:
        rack: 1
        ssl:
          'cert': "#{__dirname}/certs/worker1_cert.pem"
          'key': "#{__dirname}/certs/worker1_key.pem"
    'worker2.ryba':
      ip: '10.10.10.17'
      modules: [
        'masson/core/reload'
        # Commons
        'masson/core/network'
        'masson/core/network_check'
        'masson/core/users'
        'masson/core/ssh'
        'masson/core/ntp'
        'masson/core/proxy'
        'masson/core/yum'
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
        # 'ryba/presto'
        'ryba/ganglia/monitor'
      ]
      ryba:
        rack: 2
        ssl:
          'cert': "#{__dirname}/certs/worker2_cert.pem"
          'key': "#{__dirname}/certs/worker2_key.pem"
