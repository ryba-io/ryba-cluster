
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
        'ryba/zookeeper/server'
        'ryba/hadoop/hdfs_jn'
        'ryba/hadoop/zkfc'
        'ryba/hadoop/hdfs_nn'
        # 'ryba/hadoop/yarn_rm'
        'ryba/hbase/master'
        'ryba/kafka/server'
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
                principal: 'wdavidw@HADOOP.RYBA'
                password: 'test'
              ,
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
        'ryba/zookeeper/server'
        'ryba/hadoop/hdfs_jn'
        'ryba/hadoop/zkfc'
        'ryba/hadoop/hdfs_nn'
        'ryba/hadoop/mapred_jhs'
        'ryba/hadoop/yarn_rm'
        'ryba/kafka/server'
        # 'ryba/hive/server'
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
        # Hadoop
        'masson/commons/mysql_server'
        # 'ryba/xasecure/policymgr'
        # 'ryba/xasecure/uxugsync'
        'ryba/zookeeper/server'
        'ryba/hadoop/hdfs_jn'
        # 'ryba/hadoop/yarn_ts'
        'ryba/hive/hcatalog'
        'ryba/hive/server2'
        'ryba/hive/webhcat'
        'ryba/hbase/rest'
        'ryba/oozie/server'
        # 'ryba/elasticsearch'
        # 'ryba/rexster'
        # 'ryba/kafka/server'
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
            # 'HADOOP.RYBA':
            #   kadmin_principal: 'wdavidw/admin@HADOOP.RYBA'
            #   kadmin_password: 'test'
            #   principals: [
            #     principal: 'wdavidw@HADOOP.RYBA'
            #     password: 'test'
            #   ,
            #     principal: 'krbtgt/HADOOP.RYBA@USERS.RYBA'
            #     password: 'test'
            #   ]
            'USERS.RYBA':
              kadmin_principal: 'wdavidw/admin@USERS.RYBA'
              kadmin_password: 'test'
              principals: [
                principal: 'wdavidw@USERS.RYBA'
                password: 'test'
              ,
                principal: 'krbtgt/HADOOP.RYBA@USERS.RYBA'
                password: 'test'
              ]
        kdc_conf:
          # realms:
          #   'HADOOP.RYBA':
          #     kadmind_port: 4601
          #   'USERS.RYBA':
          #     kadmind_port: 4611
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
        'ryba/zookeeper/client'
        'ryba/hadoop/hdfs_client'
        'ryba/hadoop/yarn_client'
        'ryba/hbase/client'
        'ryba/tools/pig'
        'ryba/hive/client'
        'ryba/oozie/client'
        'ryba/tools/sqoop'
        'ryba/tools/flume'
        'ryba/tools/mahout'
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
        'ryba/hadoop/hdfs_dn'
        'ryba/hadoop/yarn_nm'
        'ryba/hadoop/mapred_client'
        'ryba/tools/flume'
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
        'ryba/hadoop/hdfs_dn'
        'ryba/hadoop/yarn_nm'
        'ryba/hadoop/mapred_client'
        'ryba/tools/flume'
        'ryba/hbase/regionserver'
        'ryba/ganglia/monitor'
      ]
      ryba:
        rack: 2
        ssl:
          'cert': "#{__dirname}/certs/worker2_cert.pem"
          'key': "#{__dirname}/certs/worker2_key.pem"
