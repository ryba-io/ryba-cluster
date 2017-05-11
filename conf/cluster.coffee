
module.exports =
  config: require './config'
  services:
    # 'masson/bootstrap/connection':
    #   constraints: tags: 'environment': 'prod'
    'masson/core/system':
      constraints: tags: 'environment': 'prod'
      config: system:
        selinux: false
        limits: {}
        users: {}
    'masson/core/yum':
      constraints: tags: 'environment': 'prod'
      config: yum:
        packages:
          'tree': true, 'git': true, 'htop': false, 'vim': true, 
          'bash-completion': true, 'unzip': true,
          'net-tools': true # Install netstat
    'masson/core/ssh':
      constraints: tags: 'environment': 'prod'
      config: ssh:
        banner:
          target: '/etc/banner'
          content: "Welcome to Hadoop!"
        sshd_config:
          PermitRootLogin: 'without-password'
    'masson/core/ntp':
      constraints: tags: 'environment': 'prod'
      config: ntp:
        servers: ['master3.ryba']
    'masson/core/network':
      constraints: tags: 'environment': 'prod'
    'masson/core/cgroups':
      constraints: tags: 'role': 'worker'
    'masson/core/saslauthd':
      constraints: nodes: ['master2.ryba', 'master3.ryba']
      config: saslauthd:
        "conf":
          "ldap_servers": "ldap://ryba.io"
          "ldap_search_base": "dc=ryba,dc=io"
          "ldap_filter": "cn=%u"
          "ldap_bind_dn": "cn=sasladm,ou=users,dc=ryba,dc=io"
          "ldap_password": "secret"
    'masson/core/openldap_server':
      constraints: nodes: ['master2.ryba', 'master3.ryba']
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
          tls_cert_local: true
          tls_key_local: true
        openldap_server_krb5:
          krbadmin_user:
            mail: 'david@adaltas.com'
            userPassword: 'test'
    'masson/core/openldap_client':
      constraints: nodes: ['master3.ryba', 'master2.ryba']
      config:  openldap_client:
        certificates: [
          source: "#{__dirname}/certs/cacert.pem", local: true
        ]
        config: {}
    'masson/core/krb5_server':
      constraints: nodes: ['master1.ryba']
      config: krb5:
        # database_module: 'openldap_master3'
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
          realms:
            'HADOOP.RYBA':
              database_module: 'masson_default'
          dbmodules:
            'masson_default':
              kdc_master_key: 'test'
    'masson/core/krb5_client': {}
    'masson/commons/httpd':
      constraints: nodes: ['master3.ryba']
    # 'masson/commons/postgres/server':
    #   constraints: nodes: ['master3.ryba']
    'masson/commons/mysql/client':
      constraints: tags: 'environment': 'prod'
    'masson/commons/mysql/server':
      constraints: nodes: ['master1.ryba']
      config: mysql: server:
        current_password: ''
        password: 'MySQL123-'
        my_conf: {}
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
      config: ryba:
        force_check: true
        clean_logs: true
        check_hdfs_fsck: false
        security: 'kerberos'
        nameservice: 'torval'
        realm: 'HADOOP.RYBA'
        krb5_user: # User used for testing
          password: 'test123'
          password_sync: true
        ssl:
          'cacert': "#{__dirname}/certs/cacert.pem"
        #   'cert': "#{__dirname}/certs/hadoop_cert.pem"
        #   'key': "#{__dirname}/certs/hadoop_key.pem"
        ssh_fencing:
          private_key: "#{__dirname}/hdfs_keys/id_rsa"
          public_key: "#{__dirname}/hdfs_keys/id_rsa.pub"
        hadoop_opts: '-Djava.net.preferIPv4Stack=true -Dsun.security.krb5.debug=false'
        core_site:
          'hadoop.ssl.exclude.cipher.suites': 'SSL_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA,SSL_RSA_EXPORT_WITH_DES40_CBC_SHA,SSL_RSA_EXPORT_WITH_RC4_40_MD5,TLS_DHE_RSA_WITH_AES_128_CBC_SHA,TLS_DHE_RSA_WITH_AES_256_CBC_SHA'
          #'hadoop.proxyuser.flume.groups': '*'
          #'hadoop.proxyuser.flume.hosts': '*'
          # 'hadoop.security.auth_to_local': """
          #       RULE:[2:$1@$0]([rn]m@.*)s/.*/yarn/
          #       RULE:[2:$1@$0](ats@.*)s/.*/yarn/
          #       RULE:[2:$1@$0](jhs@.*)s/.*/mapred/
          #       RULE:[2:$1@$0]([nd]n@.*)s/.*/hdfs/
          #       RULE:[2:$1@$0](hm@.*)s/.*/hbase/
          #       RULE:[2:$1@$0](rs@.*)s/.*/hbase/
          #       RULE:[2:$1@$0](opentsdb@.*)s/.*/hbase/
          #       RULE:[1:$1@$0](^.*@HADOOP\\.RYBA$)s/^(.*)@HADOOP\\.RYBA$/$1/g
          #       RULE:[2:$1@$0](^.*@HADOOP\\.RYBA$)s/^(.*)@HADOOP\\.RYBA$/$1/g
          #       RULE:[1:$1@$0](^.*@USERS\\.RYBA$)s/^(.*)@USERS\\.RYBA$/$1/g
          #       RULE:[2:$1@$0](^.*@USERS\\.RYBA$)s/^(.*)@USERS\\.RYBA$/$1/g
          #       DEFAULT
          # """
        hadoop_metrics:
          '*.sink.file.class': 'org.apache.hadoop.metrics2.sink.FileSink'
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
      config: ryba: yarn:
        site:
          # Set mem check to false for testing purpose
          'yarn.nodemanager.pmem-check-enabled': 'false'
          'yarn.nodemanager.vmem-check-enabled': 'false'
    'ryba/hadoop/yarn_client':
      constraints: tags: 'role': 'client'
    'ryba/hadoop/mapred_jhs':
      constraints: nodes: ['master3.ryba']
    'ryba/hadoop/mapred_client':
      constraints: tags: 'role': 'client'
    'ryba/hadoop/zkfc':
      constraints: nodes: ['master1.ryba', 'master2.ryba']
    'ryba/benchmark':
      constraints: nodes: ['front1.ryba']
      config: ryba: benchmark:
        "iterations": 1
        "datanodes": [
          "https://worker1.ryba:50475/jmx"
          "https://worker2.ryba:50475/jmx"
          "https://worker3.ryba:50475/jmx"
        ]
        "output": "./benchmark"
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
    # 'ryba/opentsdb':
    #   constraints: nodes: ['master3.ryba']
    'ryba/pig':
      constraints: tags: 'role': 'client'
    'ryba/sqoop':
      constraints: tags: 'role': 'client'
    'ryba/hive/hcatalog':
      constraints: nodes: ['master2.ryba', 'master3.ryba']
      config: ryba: hive: hcatalog:
        db:
          password: 'Hive123!'
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
      config: ryba: oozie:
        db:
          password: 'Oozie123!'
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
      constraints: nodes: ['master1.ryba']
      config: ryba: ambari_server:
        repo: false
        cluster_name: 'cluster_01'
        admin_password: 'admin123'
        master_key: 'ambariMasterKey123'
        config:
          'api.ssl': 'false'
        db:
          engine: 'mysql'
          password: 'Ambari123-'
    'ryba/ambari/agent':
      constraints: tags: 'role': 'client'
    # Druid
    'ryba/druid':
      config: ryba: druid:
        db: password: 'Druid123-'
    'ryba/druid/broker':
      constraints: tags: 'role': 'master'
      config: ryba: druid:
        broker: jvm:
          xms: '128m'
          xmx: '512m'
    'ryba/druid/coordinator':
      constraints: tags: 'role': 'worker'
      config: ryba: druid:
        coordinator: jvm:
          xms: '128m' # Default is 3g
          xmx: '512m' # Default is 3g
    'ryba/druid/overlord':
      constraints: tags: 'role': 'worker'
      config: ryba: druid:
        overlord: jvm:
          xms: '128m' # Default is 3g
          xmx: '512m' # Default is 3g
    'ryba/druid/historical':
      constraints: tags: 'role': 'worker'
      config: ryba: druid:
        historical: jvm:
          xms: '128m' # Default is 8g
          xmx: '512m' # Default is 8g
    'ryba/druid/middlemanager':
      constraints: tags: 'role': 'worker'
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
    # 'ryba/nifi':
    #   constraints: tags: 'role': 'worker'
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
        openldap_server:
          tls_cert_file: "#{__dirname}/certs/master2_cert.pem"
          tls_key_file: "#{__dirname}/certs/master2_key.pem"
        ryba: ssl:
          'cert': "#{__dirname}/certs/master2_cert.pem"
          'key': "#{__dirname}/certs/master2_key.pem"
    'master3.ryba':
      tags:
        'environment': 'prod'
        'role': 'master'
      config:
        ip: '10.10.10.13'
        openldap_server:
          tls_cert_file: "#{__dirname}/certs/master3_cert.pem"
          tls_key_file: "#{__dirname}/certs/master3_key.pem"
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
    'worker3.ryba':
      tags:
        'environment': 'prod'
        'role': 'worker'
      config:
        ip: '10.10.10.18'
        ryba: ssl:
          'cert': "#{__dirname}/certs/worker3_cert.pem"
          'key': "#{__dirname}/certs/worker3_key.pem"
