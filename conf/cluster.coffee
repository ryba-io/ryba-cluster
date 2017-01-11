
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
    'masson/core/openldap_server':
      constraints: nodes: ['master3.ryba']
    'masson/core/krb5_server':
      constraints: nodes: ['master1.ryba']
      config:
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
    # 'krb5_server_clients':
    #   module: 'masson/core/krb5_server'
    #   constraints:
    #     nodes: ['master3.ryba']
    #   config:
    #     krb5:
    #       etc_krb5_conf:
    #         realms:
    #           'USERS.RYBA':
    #             kadmin_principal: 'users/admin@USERS.RYBA'
    #             kadmin_password: 'test'
    #             principals: [
    #               principal: 'krbtgt/HADOOP.RYBA@USERS.RYBA'
    #               password: 'test'
    #             ]
    #       kdc_conf:
    #         dbmodules:
    #           'openldap_master3':
    #             kdc_master_key: 'test'
    'masson/core/krb5_client': {}
    'masson/commons/postgres/server':
      constraints: nodes: ['master3.ryba']
    'masson/commons/mysql/server':
      constraints: nodes: ['master1.ryba']
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
      constraints: tags: 'role': 'client'
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
    'ryba/kafka/broker':
      constraints: tags: 'role': 'master'
    'ryba/kafka/consumer':
      constraints: tags: 'role': 'client'
    'ryba/kafka/producer':
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
