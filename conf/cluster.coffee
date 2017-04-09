
module.exports =
  config: require './config'
  services:
    # 'masson/bootstrap/connection':
    #   constraints: tags: 'environment': 'prod'
    'masson/core/system':
      constraints: tags: 'environment': 'prod'
    'masson/core/yum':
      constraints: tags: 'environment': 'prod'
    'masson/core/ssh':
      constraints: tags: 'environment': 'prod'
    'masson/core/ntp':
      constraints: tags: 'environment': 'prod'
    'masson/core/network':
      constraints: tags: 'environment': 'prod'
    'masson/core/cgroups':
      constraints: tags: 'role': 'worker'
    'masson/core/openldap_server':
      constraints: nodes: ['master3.ryba']
      config:
        openldap_server:
          suffix: 'dc=ryba'
          root_dn: 'cn=ldapadm,dc=ryba'
          root_password: 'test'
          config_dn: 'cn=admin,cn=config'
          config_password: 'test'
          users_dn: 'ou=users,dc=ryba'
          groups_dn: 'ou=groups,dc=ryba'
          ldapdelete: []
          ldapadd: []
          tls: true
          tls_ca_cert_file: "#{__dirname}/certs/cacert.pem"
          tls_ca_cert_local: true
          tls_cert_file: "#{__dirname}/certs/master3_cert.pem"
          tls_cert_local: true
          tls_key_file: "#{__dirname}/certs/master3_key.pem"
          tls_key_local: true
        openldap_server_krb5:
          root_dn: 'cn=ldapadm,dc=ryba'
          root_password: 'test'
          krbadmin_user:
            mail: 'david@adaltas.com'
            userPassword: 'test'
    'masson/core/openldap_client':
      constraints: nodes: ['master3.ryba']
      config: 
        openldap_client:
          certificates: [
            source: "#{__dirname}/certs/cacert.pem", local: true
          ]
          config: {}
    'masson/core/krb5_server':
      constraints: nodes: ['master1.ryba']
      config:
        krb5:
          etc_krb5_conf:
            libdefaults:
              default_realm: 'HADOOP.RYBA'
            realms:
              'HADOOP.RYBA': {}
              'USERS.RYBA': {}
            domain_realm:
              '.ryba': 'HADOOP.RYBA'
              'ryba': 'HADOOP.RYBA'
            realms:
              'HADOOP.RYBA':
                kadmin_principal: 'wdavidw/admin@HADOOP.RYBA'
                kadmin_password: 'test'
                principals: [
                  principal: 'krbtgt/HADOOP.RYBA@USERS.RYBA'
                  password: 'test'
                ]
          kdc_conf:
            realms: {}
            dbmodules:
              'openldap_master3':
                kdc_master_key: 'test'
    'masson/core/krb5_client': {}
    'masson/commons/httpd':
      constraints: nodes: ['master3.ryba']
    'masson/commons/postgres/server':
      constraints: nodes: ['master3.ryba']
    'masson/commons/mysql/client':
      constraints: tags: 'environment': 'prod'
    'masson/commons/mysql/server':
      constraints: nodes: ['master1.ryba']
      config: mysql: server:
        current_password: ''
        my_conf: {}
        password: 'MySQL123-'
    # 'masson/commons/mysql/server.5.7':
    #   constraints: nodes: ['worker2.ryba']
    #   config: mysql: server:
    #     password: 'MySQL123-'
    # 'ryba/hdp': {}
    'ryba/zookeeper/server':
      constraints: tags: 'role': 'master'
    'ryba/zookeeper/client':
      constraints: tags: 'role': 'client'
    # 'ryba/ranger/admin':
    #   constraints: nodes: ['master3.ryba']
    'ryba/hadoop/core':
      constraints: tags: 'role': ['client', 'master', 'worker']
      config:
        realm: 'HADOOP.RYBA'
    'ryba/hadoop/kms':
      constraints: nodes: ['master3.ryba']
    'ryba/hadoop/hdfs_dn':
      constraints: tags: 'role': 'worker'
    'ryba/hadoop/hdfs_jn':
      constraints:
        tags: 'role': 'master'
    'ryba/hadoop/hdfs_nn':
      constraints: nodes: ['master1.ryba', 'master2.ryba']
      config:
        nameservice: 'torval'
    'ryba/hadoop/hdfs_client':
      constraints: tags: 'role': 'client'
    'ryba/hadoop/httpfs':
      constraints: tags: 'role': 'master'
    'ryba/hadoop/yarn_rm':
      constraints: nodes: ['master1.ryba', 'master2.ryba']
    'ryba/hadoop/yarn_ts':
      constraints: nodes: ['master3.ryba']
    'ryba/hadoop/yarn_nm':
      constraints: tags: 'role': 'worker'
    'ryba/hadoop/yarn_client':
      constraints: tags: 'role': 'client'
    'ryba/hadoop/mapred_jhs':
      constraints: nodes: ['master3.ryba']
    'ryba/hadoop/mapred_client':
      constraints: tags: 'role': 'client'
    'ryba/hadoop/zkfc':
      constraints: nodes: ['master1.ryba', 'master2.ryba']
    'ryba/tez':
      constraints: nodes: ['front1.ryba', 'master3.ryba']
    'ryba/hbase/master':
      constraints: nodes: ['master1.ryba', 'master2.ryba']
    'ryba/hbase/regionserver':
      constraints: tags: 'role': 'worker'
    'ryba/hbase/rest':
      constraints: nodes: ['master3.ryba']
    'ryba/hbase/thrift':
      constraints: nodes: ['master3.ryba']
    'ryba/hbase/client':
      constraints: nodes: 'role': 'client'
    'ryba/phoenix/client':
      constraints: tags: 'role': 'client'
    'ryba/phoenix/queryserver':
      constraints: nodes: ['master3.ryba']
    'ryba/opentsdb':
      constraints: nodes: ['master3.ryba']
    'ryba/pig':
      constraints: tags: 'role': 'client'
    'ryba/sqoop':
      constraints: tags: 'role': 'client'
    'ryba/hive/hcatalog':
      constraints: nodes: ['master2.ryba', 'master3.ryba']
    'ryba/hive/server2':
      constraints: nodes: ['master1.ryba', 'master2.ryba']
    'ryba/hive/webhcat':
      constraints: nodes: ['master3.ryba']
    'ryba/hive/client':
      constraints: tags: 'role': 'client'
    'ryba/hive/beeline':
      constraints: tags: 'role': 'client'
    'ryba/oozie/server':
      constraints: nodes: ['master3.ryba']
    'ryba/oozie/client':
      constraints: tags: 'role': 'client'
    # Kafka
    'ryba/kafka/broker':
      constraints: tags: 'role': 'master'
    'ryba/kafka/consumer':
      constraints: tags: 'role': 'client'
    'ryba/kafka/producer':
      constraints: tags: 'role': 'client'
    # Ambari
    'ryba/ambari/server':
      constraints: nodes: ['master3.ryba']
      config: ryba: ambari_server:
        repo: false
        cluster_name: 'cluster_01'
        db:
          engine: 'mysql'
          password: 'ambari123'
    'ryba/ambari/agent':
      constraints: tags: 'role': 'client'
    # Druid
    # 'ryba/druid/broker':
    #   constraints: tags: 'role': 'master'
    # 'ryba/druid/coordinator':
    #   constraints: tags: 'role': 'worker'
    # 'ryba/druid/overlord':
    #   constraints: tags: 'role': 'worker'
    # 'ryba/druid/historical':
    #   constraints: tags: 'role': 'worker'
    # 'ryba/druid/middlemanager':
    #   constraints: tags: 'role': 'worker'
    # ElasticSearch
    # 'ryba/elasticsearch':
    #   constraints: tags: 'role': 'worker'
    # 'ryba/solr/cloud_docker':
    #   constraints: tags: 'role': 'worker'
    # Hue
    # 'ryba/huedocker':
    #   constraints: tags: 'role': 'client'
    # Knox
    # 'ryba/knox':
    #   constraints: tags: 'role': 'client'
    # Nifi
    'ryba/nifi':
      constraints: tags: 'role': 'worker'
    # MongoDB
    # 'ryba/mongodb/configsrv':
    #   constraints: tags: 'role': 'master'
    # 'ryba/mongodb/router':
    #   constraints: nodes: ['master2.ryba', 'master3.ryba']
    #   # config:
    #   #   mongo_router_for_configsrv: 'configsrvRepSet1'
    # 'ryba/mongodb/shard':
    #   constraints: tags: 'role': 'worker'
    # 'ryba/elasticsearch':
    #   constraints: tags: 'role': 'worker'
    # 'ryba/spark/client':
    #   constraints: tags: 'role': 'client'
    # 'ryba/zeppelin':
    #   constraints: tags: 'role': 'client'
  nodes:
    'master1.ryba':
      tags:
        'environment': 'prod'
        'role': 'master'
      config:
        ip: '10.10.10.11'
        ryba: ssl:
          'cert': "#{__dirname}/certs/master1_cert.pem"
          'key': "#{__dirname}/certs/master1_key.pem"
    'master2.ryba':
      tags:
        'environment': 'prod'
        'role': 'master'
      config:
        ip: '10.10.10.12'
        ryba: ssl:
          'cert': "#{__dirname}/certs/master2_cert.pem"
          'key': "#{__dirname}/certs/master2_key.pem"
    'master3.ryba':
      tags:
        'environment': 'prod'
        'role': 'master'
      config:
        ip: '10.10.10.13'
        ryba: ssl:
          'cert': "#{__dirname}/certs/master3_cert.pem"
          'key': "#{__dirname}/certs/master3_key.pem"
    'front1.ryba':
      tags:
        'environment': 'prod'
        'role': 'client'
      config:
        ip: '10.10.10.14'
        ryba: ssl:
          'cert': "#{__dirname}/certs/front1_cert.pem"
          'key': "#{__dirname}/certs/front1_key.pem"
    'worker1.ryba':
      tags:
        'environment': 'prod'
        'role': 'worker'
      config:
        ip: '10.10.10.16'
        ryba: ssl:
          'cert': "#{__dirname}/certs/worker1_cert.pem"
          'key': "#{__dirname}/certs/worker1_key.pem"
    'worker2.ryba':
      tags:
        'environment': 'prod'
        'role': 'worker'
      config:
        ip: '10.10.10.17'
        ryba: ssl:
          'cert': "#{__dirname}/certs/worker2_cert.pem"
          'key': "#{__dirname}/certs/worker2_key.pem"
