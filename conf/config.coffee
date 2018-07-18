
module.exports =
  nikita:
    domain: true
    cache_dir: "#{__dirname}/../cache"
    log_serializer: true
    debug: false
    clean_logs: true
    force_check: false
    log_md:
      archive: false
      rotate: true
    ssh:
      # Sudo Access
      # username: 'vagrant'
      # private_key_path: "#{require('os').homedir()}/.vagrant.d/insecure_private_key"
      # Root Access
      private_key: """
      -----BEGIN RSA PRIVATE KEY-----
      MIIEogIBAAKCAQEArBDFt50aN9jfIJ629pRGIMA1fCMb9RyTHt9A+jx3FOsIOtJs
      eaBIpv98drbFVURr+cUs/CrgGVk5k2NIeiz0bG4ONV5nTwx38z5CzqLb7UryZS3i
      a/TS14fWOxvWTRR27R71ePX90G/ZIReKFeTrucw9y9Pl+xAzsmeblRwLBxv/SWBX
      Uai2mHAZaejlG9dGkn9f2n+oPmbgk6krLMCjLhlNBnkdroBNSXGA9ewLPFF4y54Q
      kBqmG3eLzCqAKAzwyJ5PpybtNGAWfN81gY/P5LBzC66WdtEzpwsYAv1wCioqggtg
      xVZN2s0ajxQrCxahRkXstBI2IDcm2qUTxaDbUwIDAQABAoIBAFruOi7AvXxKBhCt
      D6/bx/vC2AEUZM/yG+Wywhn8HkpVsvGzBlR4Wiy208XA7SQUlqNWimFxHyEGQCEd
      1M2MOFedCbE2hI4H3tQTUSb2dhc/Bj5mM0QuC8aPKK3wFh6B9B93vu3/wfSHR03v
      rK/JXLHBt96hyuYVN9zOWDBCs6k7SdQ2BcsQLiPg6feTsZelJDuO+DO65kKLMiz3
      mNPThErklRaKovNk47LSYakk6gsJXrpG6JWQ6nwsRenwplDwZ8Zs9mlRi7f3nChM
      3I1WlISN8y2kcQBQ94YZKk8wzH/lzmxsabcLa5ETNubxQ6ThDu1oYUIIUsQyNPm+
      DkW0VwECgYEA5MttelspKexWS39Y3sQYvZ/v8VZBQl4tRbpUWWc+PNEtcEwOBza/
      H4jBWYd2eWKTApJT1st58E4b34Mv88nQVElLb3sE7uJMkihPyNpABGbCvr63hDYw
      PyL53nKaPelY/aDnL0F8LmREfdKw/uy6+UChgkPfdo2VVk1oyvsZaRMCgYEAwIZ+
      lCmeXQ4mU6uxO+ChhDn7zw9rR5qlCyfJiLPe2lV20vaHV5ZfKIWGegsVJSpFr2ST
      5ghh+FVIneoNRtTHEKwNWCK7I6qeF+WAaci+KsLQigJQHsw58n9cdA7wHHc475n/
      pf7efoPcvk6qYOS2mpDgC87m+o3C4Dyspqp9TMECgYA4/ed+dBjT5Zg1ZDp5+zUC
      f0Wgw1CsPJNgbCK4xnv9YEnGUFuqNlvzefhX2eOMJx7hpBuYRMVSM9LDoYUfYCUx
      6bQNyAIZk2tpePsu2BbcQdC+/PjvySPJhmfhnoCHbYoKW7tazSAm2jkpcoM+bS/C
      CPRyY3/Voz0Q62VwMo5I2wKBgB4mMbZUGieqapgZwASHdeO2DNftKzioYAYyMd5F
      hLWeQqBg2Or/cmFvH5MHH0WVrBn+Xybb0zPHbzrDh1a7RX035FMUBUhdlKpbV1O5
      iwY5Qd0K5a8c/koaZckK+dELXpAvBpjhI8ieL7hhq07HIk1sOJnAye0cvBLPjZ3/
      /uVBAoGAVAs6tFpS0pFlxmg4tfGEm7/aP6FhyBHNhv2QGluw8vv/XVMzUItxGIef
      HcSMWBm08IJMRJLgmoo1cuQv6hBui7JpDeZk/20qoF2oZW9lJ9fdRObJqi61wufP
      BNiriqexq/eTy2uF9RCCjLItWxUscVMlVt4V65HLkCF5WxCQw+o=
      -----END RSA PRIVATE KEY-----
      """
      public_key: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsEMW3nRo32N8gnrb2lEYgwDV8Ixv1HJMe30D6PHcU6wg60mx5oEim/3x2tsVVRGv5xSz8KuAZWTmTY0h6LPRsbg41XmdPDHfzPkLOotvtSvJlLeJr9NLXh9Y7G9ZNFHbtHvV49f3Qb9khF4oV5Ou5zD3L0+X7EDOyZ5uVHAsHG/9JYFdRqLaYcBlp6OUb10aSf1/af6g+ZuCTqSsswKMuGU0GeR2ugE1JcYD17As8UXjLnhCQGqYbd4vMKoAoDPDInk+nJu00YBZ83zWBj8/ksHMLrpZ20TOnCxgC/XAKKiqCC2DFVk3azRqPFCsLFqFGRey0EjYgNybapRPFoNtT Ryba Hadoop'
      root:
        username: 'vagrant'
        private_key_path: "#{require('os').homedir()}/.vagrant.d/insecure_private_key"
  params:
    commands:
      capacity:
        run: 'ryba/lib/capacity'
        options: [
          name: 'output', shortcut: 'o', type: 'string', required: true
          description: 'output file'
        ,
          name: 'config', shortcut: 'c', type: 'array'
          description: 'config files'
        ,
          name: 'clusters', type: 'boolean'
          description: 'Print list of cluster names'
        ,
          name: 'format', shortcut: 'f', type: 'string'
          description: 'Format of the output files: [json, cson, js, coffee]'
        ,
          name: 'overwrite', shortcut: 'w', type: 'boolean' # default: 'text'
          description: 'Overwrite any existing file.'
        ,
          name: 'service', shortcut: 's', type: 'string'
          description: 'Print configuration of a services (format cluster:service)'
        ,
          name: 'service_names', type: 'boolean'
          description: 'Print list of service names'
        ,
          name: 'partitions', shortcut: 'p', type: 'array'
          description: 'List of disk partitions unless discovered.'
        ,
          name: 'hdfs_nn_name_dir' # default: './hdfs/name'
          description: 'Absolute path to a single directory or relative path to the HDFS NameNode directories.'
        ,
          name: 'hdfs_dn_data_dir' # default: './hdfs/data', eg '/mydata/1/hdfs/dn,/mydata/2/hdfs/dn'
          description: 'List of absolute paths or a relative path for HDFS DataNode directories.'
        ,
          name: 'yarn_nm_local_dir' # default: './yarn/local', eg '/mydata/1/yarn/local,/mydata/2/yarn/local'
          description: 'List of absolute paths or a relative path for YARN NodeManager directories.'
        ,
          name: 'yarn_nm_log_dir' # default: './yarn/log', eg '/mydata/1/yarn/log,/mydata/2/yarn/log'
          description: 'List of absolute paths or a relative path for YARN NodeManager directories.'
        ,
          name: 'kafka_data_dir' # default: './kafka', eg '/mydata/1/kafka,/mydata/2/kafka'
          description: 'List of absolute paths or a relative path for Kafka Broker directories.'
        ,
          name: 'total_memory_gb'
          description: " the total memory available per server in GB"
        ,
          name: 'reserved_memory_gb'
          description: " the reserved memory for the OS in GB"
        ,
          name: 'nodemanager_memory_gb'
          description: "the memory allocated for yarn nodemanager process"
        ,
          name: 'datanode_memory_gb'
          description: "the memory allocated for hdfs nodemanager process"
        ,
          name: 'regionserver_memory_gb'
          description: "the memory allocated for hbase regionserver process"
        ]
  clusters: 'vagrant': services:
    'masson/core/system':
      affinity: type: 'tags', values: 'environment': 'dev'
      options:
        selinux: false
        limits: {}
        users:
          ryba: {}
    'masson/core/yum':
      affinity: type: 'tags', values: 'environment': 'dev'
      options:
        update: true
        packages:
          'tree': true, 'git': true, 'htop': false, 'vim': true,
          'bash-completion': true, 'unzip': true,
          'net-tools': true # Install netstat
          # 'bind-utils': true # Install dig
    # 'masson/core/fstab':
    #   affinity: tags: 'role': ['worker']
    #   options:
    #     enabled: true
    #     volumes:
    #       '/data/1':
    #         dump: '0'
    #         pass: '0'
    #         name: 'sdd'
    #         type: 'ext4'
    #         format: true
    #       '/data/2':
    #         dump: '0'
    #         pass: '0'
    #         name: 'sde'
    #         type: 'ext4'
    #         format: true
    'masson/core/ssh':
      affinity: type: 'tags', values: 'environment': 'dev'
      options:
        banner:
          target: '/etc/banner'
          content: "Welcome to Hadoop!"
        sshd_config:
          PermitRootLogin: 'without-password'
        users:
          root:
            home: '/root'
            authorized_keys:  [
              'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwlAlI5py1aXaK8LMLjiAn1bCH3ke4DuZmsdTXjGPTdngp4bS2ANRKDSfCB1+OlII6mf+U4dkt/CiNftuhLfyYiXzwgmEM5Wa7nfuVOFKKAfnz6aVi+aARgMd4q63RGuCHkdU+NYGZr038PyfElalYo2OYrcqGA+25GCjCooOi4VPkPcEKF8MyyK+WDKcFAvZyuQtLQ/yLGhFkNYtQbzprYl+FQ8cyBFS8D4/R4soztyqd0oi/cHl/wc8MAMJ2wZ3D1dv0LYgzJeUhsrbQCwzrhgUK6dQwTm32DztMrwqWGAtUZjb4EYFAcky1dpn476Ay3GWxcIvT5VlYR3FvVs6B bakalian@lucas-adaltas'
            ]
    'masson/core/ntp':
      affinity: type: 'tags', values: 'environment': 'dev'
      options:
        servers: ['master03.metal.ryba']
    'masson/core/network':
      affinity: type: 'tags', values: 'environment': 'dev'
      options:
        hosts:
          # '127.0.0.1': 'localhost localhost.localdomain localhost4 localhost4.localdomain4'
          '10.10.10.10': 'repos.ryba ryba'
          '10.10.10.1': 'bakalian.ryba'
        hosts_auto: true
        resolv: """
          search metal.ryba
          nameserver 10.10.10.13
          nameserver 10.0.2.3
          """
    'masson/core/ssl':
      affinity: type: 'tags', values: 'environment': 'dev'
      options:
        cacert:
          source: "#{__dirname}/certs/ca.cert.pem"
          local: true
        truststore:
          password: 'Truststore123-'
        keystore:
          password: 'Keystore123-'
          keypass: 'Keystore123-'
    'masson/core/iptables':
      affinity: type: 'tags', values: 'environment': 'dev'
      options:
        action: 'stop'
        startup: false
        redirect_log: true
        rules: [
          # { chain: 'INPUT', jump: 'ACCEPT', source: "10.10.10.0/24", comment: 'Local Network' }
        ]
    'masson/core/cgroups':
      affinity: type: 'tags', values: 'role': 'worker'
    'masson/core/locale':
      affinity: type: 'tags', values: 'environment': 'dev'
    'masson/commons/java':
      affinity: type: 'tags', values: 'environment': 'dev'
      options:
        jdk:
          version: '1.8.0_101'
          versions:
            '1.8.0_101':
              jdk_location: 'http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz'
              jce_location: 'http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip'
    'masson/core/saslauthd':
      affinity: type: 'nodes', match: 'any', values: ['master02.metal.ryba', 'master03.metal.ryba']
      options:
        # 'default':
        #   'START': 'yes'
        #   'DESC': 'SASL Authentication Daemon'
        #   'NAME': 'saslauthd'
        #   'MECHANISMS': 'kerberos5'
        #   'MECH_OPTIONS': ''
        #   'THREADS': '5'
        #   'OPTIONS': '-c -m /var/run/saslauthd'
        # "conf":
        # LDAP example
        "conf":
          "ldap_servers": "ldap://ryba.io"
          "ldap_search_base": "dc=ryba,dc=io"
          "ldap_filter": "cn=%u"
          "ldap_bind_dn": "cn=sasladm,ou=users,dc=ryba,dc=io"
          "ldap_password": "secret"
    'masson/core/openldap_server':
      affinity: type: 'nodes', match: 'any', values: ['master02.metal.ryba', 'master03.metal.ryba']
      options:
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
        tls_ca_cert_file: "#{__dirname}/certs/ca.cert.pem"
        tls_ca_cert_local: true
        tls_cert_local: true
        tls_key_local: true
        krb5:
          krbadmin_user:
            mail: 'david@adaltas.com'
            userPassword: 'test'
        entries:
          users:
            test_user_ryba:
              userPassword: 'test'
              uidNumber: 9600
              gidNumber: 9600
    'masson/core/openldap_client':
      affinity: type: 'nodes', match: 'any', values: ['master03.metal.ryba', 'master02.metal.ryba']
      options:
        certificates: [
          source: "#{__dirname}/certs/ca.cert.pem", local: true
        ]
        config: {}
    # 'ryba/ambari/standalone':
    #   affinity: type: 'nodes', values: ['edge01.metal.ryba']
    #   options:
    #     source: "#{__dirname}/users/offline/ambari.repo"
    #     admin_password: 'admin123'
    #     master_key: 'ambariMasterKey123'
    #     db:
    #       engine: 'mysql'
    #       database: 'ambari_views'
    #       password: 'Ambari123-'
    #     truststore: password: 'AmbariTruststore123-'
    #     jaas:
    #       enabled: true
    #       principal: 'ambari/_HOST@HADOOP.RYBA'
    #     views:
    #       enabled: true
    #       files:
    #         enabled: true#default to true
    #         version: '1.0.0'
    #       hive:
    #         enabled: true
    #         version: '1.5.0'
    #       tez:
    #         enabled: true
    #         version: '0.7.0.2.6.1.0-118'
    #       wfmanager:
    #         enabled: true
    #         version: '1.0.0'
    'masson/core/sssd':
      affinity: type: 'tags', values: 'environment': 'dev'
      options:
        force_check: false
        certificates: [
          "#{__dirname}/certs/ca.cert.pem"
        ]
        config:
          # 'domain/hadoop':
          #   'debug_level': '1'
          #   'cache_credentials' : 'True'
          #   'ldap_search_base' : 'ou=users,dc=ryba'
          #   'ldap_group_search_base' : 'ou=groups,dc=ryba'
          #   'id_provider' : 'ldap'
          #   'auth_provider' : 'ldap'
          #   'chpass_provider' : 'ldap'
          #   'ldap_uri' : 'ldaps://master03.metal.ryba:636'
          #   'ldap_tls_cacertdir' : '/etc/openldap/cacerts'
          #   # 'ldap_default_bind_dn' : 'cn=nssproxy,dc=ryba'
          #   'ldap_default_bind_dn' : 'cn=Manager,dc=ryba'
          #   'ldap_default_authtok' : 'test'
          #   'ldap_id_use_start_tls' : 'True'
          'domain/users':
            'debug_level': '1'
            'cache_credentials' : 'True'
            'ldap_search_base' : 'ou=users,dc=ryba'
            'ldap_group_search_base' : 'ou=groups,dc=ryba'
            'id_provider' : 'ldap'
            'auth_provider' : 'ldap'
            'chpass_provider' : 'ldap'
            'ldap_uri' : 'ldaps://master03.metal.ryba:636'
            'ldap_tls_cacertdir' : '/etc/openldap/cacerts'
            # 'ldap_default_bind_dn' : 'cn=nssproxy,dc=ryba'
            'ldap_default_bind_dn' : 'cn=ldapadm,dc=ryba'
            'ldap_default_authtok' : 'test'
            'ldap_id_use_start_tls' : 'False'
          'sssd':
            'domains' : 'hadoop,users'
    'masson/core/krb5_server':
      affinity: type: 'nodes', match: 'any', values: ['master01.metal.ryba', 'master02.metal.ryba']
      options:
        admin:
          'HADOOP.RYBA':
            kadmin_principal: 'admin/admin@HADOOP.RYBA'
            kadmin_password: 'test'
            database_module: 'hadoop_ryba_db'
            kdc_master_key: 'test'
            principals: [
              principal: 'krbtgt/HADOOP.RYBA@USERS.RYBA'
              password: 'test'
            ]
    'masson/core/krb5_client':
      affinity: type: 'tags', values: 'environment': 'dev'
    'masson/commons/git':
      affinity: type: 'tags', values: 'environment': 'dev'
      options:
        users:
          'ryba': config:
            "user": { "name": 'Ryba User', email: "ryba@ryba.io" }
    'masson/commons/docker':
      affinity: type: 'tags', values: 'environment': 'dev'
    'masson/commons/httpd':
      affinity: type: 'nodes', values: ['master03.metal.ryba']
    'masson/commons/mariadb/client':
      affinity: type: 'tags', values: 'environment': 'dev'
    'masson/commons/mariadb/server':
      affinity: type: 'nodes', match: 'any', values: ['master01.metal.ryba', 'master02.metal.ryba']
      options:
        current_password: ''
        admin_password: 'Maria123-'
        repl_master: password: 'MariaReqpl123-'
        my_conf: {}
    # 'ryba/metrics':
    #   constraints: tags: 'environment': 'dev'
    # 'ryba/log4j':
    #   constraints: tags: 'environment': 'dev'
    #   config: ryba: log4j:
    #     remote_host: 'master03.metal.ryba'
    #     remote_port: 2222
    'ryba/hdp':
      affinity: type: 'tags', values: 'environment': 'dev'
      options:
        source: 'http://public-repo-1.hortonworks.com/HDP/centos6/2.x/updates/2.5.5.0/hdp.repo'
    # 'masson/commons/postgres/server':
    #   affinity: type: 'nodes', values: ['master03.metal.ryba']
    #   options:
    #     server:
    #       password: 'test123'
    #       user: 'root'
    # 'masson/commons/mysql/client':
    #   affinity: type: 'tags', values: 'environment': 'dev'
    # 'masson/commons/mysql/server':
    #   affinity: type: 'nodes', values: ['master02.metal.ryba']
    #   options:
    #     current_password: ''
    #     admin_password: 'MySQL123-'
    #     my_conf: {}
    # 'masson/commons/mysql/server.5.7':
    #   affinity: type: 'nodes', values: ['worker02.metal.ryba']
    #   options:
    #     admin_password: 'MySQL123-'
    'ryba/zookeeper/server':
      affinity: type: 'tags', values: 'role': 'master'
      options:
        clean_logs: true
    'ryba/zookeeper/client':
      affinity: type: 'tags', values: 'role': 'client'
    'ryba/ranger/admin':
      affinity: type: 'nodes', values: ['master02.metal.ryba']
      options:
        install:
          db_password: 'rangerAdminDb123'
          audit_db_password: 'rangerLogger123'
        admin:
          password: 'rangerAdmin123'
    # # Atlas
    # # 'ryba/atlas':
    # #   affinity: type: 'nodes', values: ['master03.metal.ryba']
    # # 'ryba/atlas/hive':
    # #   affinity: type: 'nodes', match: 'any', values: ['master01.metal.ryba', 'master02.metal.ryba']
    # # 'ryba/ranger/plugins/atlas':
    # #   affinity: type: 'nodes', values: ['master03.metal.ryba']
    'ryba/commons/test_user':
      affinity: type: 'tags', values: 'environment': 'dev'
      options:
        krb5: user: # User used for testing
          password: 'test123'
          password_sync: true
    # # metrology
    # 'ryba/prometheus/monitor':
    #     affinity: type: 'nodes', values: ['master03.metal.ryba']
    # 'ryba/prometheus/jmx_exporters/zookeeper':
    #   affinity: type: 'tags', values: 'role': 'master'
    # 'ryba/grafana/webui':
    #   affinity: type: 'nodes', values: ['edge01.metal.ryba']
    #   options:
    #     db: password: 'grafana123!-'
    # 'ryba/grafana/repo':
    #   affinity: type: 'nodes', values: ['edge01.metal.ryba']
    'ryba/hadoop/core':
      affinity: type: 'tags', values: 'role': match: 'any', values: ['client', 'master', 'worker']
      options:
        # force_check: false
        # clean_logs: true
        check_hdfs_fsck: false
        security: 'kerberos'
        realm: 'HADOOP.RYBA'
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
        hadoop_heap: '512'
        hadoop_namenode_init_heap: '-Xms512m'
        ssl_server:
          'ssl.server.keystore.password': 'HadoopKeystore!'
          'ssl.client.truststore.password': 'HadoopTruststore!'
        hdfs:
          user: limits:
            nproc: 16384
            nofile: 16384
          krb5_user:
            password: 'hdfs123'
            password_sync: true
          hdfs_site:
            'dfs.namenode.safemode.extension': 1000 # "1s", default to "30s"
        mapred:
          user: limits:
            nproc: 16384
            nofile: 16384
    'ryba/hadoop/kms':
      affinity: type: 'nodes', values: ['master03.metal.ryba']
      options:
        ssl:
          password: 'KmsKeystore123!'
    'ryba/hadoop/hdfs_dn':
      affinity: type: 'tags', values: 'role': 'worker'
      options:
        sysctl:
          'vm.swappiness': 1 # Default to 60
          'vm.overcommit_memory': 1 # Default to 0
          'vm.overcommit_ratio': 100 # Default to 50
          'net.core.netdev_max_backlog': 4096 # Was 1000
          'net.core.somaxconn': 4096 # Default to 128
          'net.ipv4.ip_forward': 0 # Was already 0
          'net.ipv4.conf.default.rp_filter': 1 # Was already 0
          'net.ipv4.tcp_syncookies': 1
          'net.ipv4.tcp_sack': 1
          'net.ipv4.tcp_dsack': 1
          'net.ipv4.tcp_keepalive_intvl': 15 # Was 75
          'net.ipv4.tcp_keepalive_probes': 5 # Was 9
          'net.ipv4.tcp_keepalive_time': 600  # Was 7200
          'net.ipv4.tcp_fin_timeout': 30 # Was 60
          'net.ipv4.tcp_rmem': '32768 436600 4193404' # Was 4096 87380 6291456
          'net.ipv4.tcp_wmem': '32768 436600 4193404' # Was 4096 16384 4194304
          'net.ipv4.tcp_retries2': 10 # Was 15
          'net.ipv4.tcp_synack_retries': 3 # Was 5
          'net.ipv6.conf.all.disable_ipv6': null # Was missing, error if set to 0
          'net.ipv6.conf.default.disable_ipv6': null # Was missing, error if set to 0
          'net.ipv6.conf.lo.disable_ipv6': null # Was missing, error if set to 0
          'kernel.sysrq': 0 # Was 16
          'kernel.core_uses_pid': 1 # Was alraedy 1
          'kernel.msgmax': 65536 # Was 8192
          'kernel.msgmnb': 65536 # Was 16384
          'kernel.shmall': 4294967296 # Was 18446744073692774399
          'kernel.shmmax': 68719476736 # Was 18446744073692774399
    'ryba/hadoop/hdfs_jn':
      affinity: type: 'tags', values: 'role': 'master'
      options:
        hdfs_site:
          'dfs.journalnode.edits.dir': '/var/hdfs/edits'
    'ryba/hadoop/hdfs_nn':
      affinity: type: 'nodes', match: 'any', values: ['master01.metal.ryba', 'master02.metal.ryba']
      options:
        nameservice: 'torval'
        hdfs_site:
          'dfs.namenode.safemode.extension': '1000' # "1s", default to "30s"
        heapsize: '512m'
    'ryba/ranger/plugins/hdfs':
      affinity: type: 'nodes', match: 'any', values: ['master01.metal.ryba', 'master02.metal.ryba']
    'ryba/hadoop/hdfs_client':
      affinity: type: 'tags', values: 'role': 'client'
    'ryba/hadoop/httpfs':
      affinity: type: 'tags', values: 'role': 'master'
    'ryba/hadoop/yarn_rm':
      affinity: type: 'nodes', match: 'any', values: ['master01.metal.ryba', 'master02.metal.ryba']
      options:
        heapsize: '512m'
        user: limits:
          nproc: 16384
          nofile: 16384
        opts:
          'sun.net.spi.nameservice.provider.1': 'sun,dns' # HADOOP_JAAS_DEBUG=true
        yarn_site: {}
        capacity_scheduler:
          'yarn.scheduler.capacity.maximum-am-resource-percent': '.5'
    'ryba/ranger/plugins/yarn':
      affinity: type: 'nodes', match: 'any', values: ['master01.metal.ryba', 'master02.metal.ryba']
    'ryba/hadoop/yarn_ts':
      affinity: type: 'nodes', values: ['master03.metal.ryba']
    'ryba/hadoop/yarn_nm':
      affinity: type: 'tags', values: 'role': 'worker'
      options:
        yarn_site:
          # Set mem check to false for testing purpose
          'yarn.nodemanager.pmem-check-enabled': 'false'
          'yarn.nodemanager.vmem-check-enabled': 'false'
    'ryba/hadoop/yarn_client':
      affinity: type: 'tags', values: 'role': 'client'
      options:
        yarn_site:
          'mapreduce.job.counters.max': '10000'
          'mapreduce.job.counters.limit': '10000'
    'ryba/hadoop/mapred_jhs':
      affinity: type: 'nodes', values: ['master03.metal.ryba']
    'ryba/hadoop/mapred_client':
      affinity: type: 'tags', values: 'role': 'client'
    'ryba/hadoop/zkfc':
      affinity: type: 'nodes', match: 'any', values: ['master01.metal.ryba', 'master02.metal.ryba']
      options:
        digest:
          name: 'zkfc'
          password: 'zkfc123'
        ssh_fencing:
          private_key: "#{__dirname}/hdfs_keys/id_rsa"
          public_key: "#{__dirname}/hdfs_keys/id_rsa.pub"
    # 'ryba/benchmark':
    #   affinity: type: 'nodes', values: ['edge01.metal.ryba']
    #   options:
    #     "iterations": 1
    #     "output": "./benchmark"
    'ryba/tez':
      affinity: type: 'nodes', match: 'any', values: ['edge01.metal.ryba', 'master03.metal.ryba']
    'ryba/hbase/master':
      affinity: type: 'nodes', match: 'any', values: ['master01.metal.ryba', 'master02.metal.ryba']
      options:
        heapsize: '1024m'
        user: limits:
          nproc: 16384
          nofile: 16384
        admin:
          password: 'hbase123'
        metrics:
          '*.sink.file.class': 'org.apache.hadoop.metrics2.sink.FileSink'
    'ryba/hbase/regionserver':
      affinity: type: 'nodes', match: 'any', values: ['worker01.metal.ryba', 'worker02.metal.ryba', 'worker03.metal.ryba']
    'ryba/ranger/plugins/hbase':
      affinity: type: 'nodes', match: 'any', values: ['worker01.metal.ryba', 'worker02.metal.ryba', 'worker03.metal.ryba']
    'ryba/hbase/rest':
      affinity: type: 'nodes', values: ['master02.metal.ryba']
    'ryba/hbase/thrift':
      affinity: type: 'nodes', values: ['master02.metal.ryba']
    'ryba/hbase/client':
      affinity: type: 'tags', values: 'role': 'client'
    'ryba/phoenix/client':
      affinity:
        match: 'any'
        values: [
          type: 'tags', values: 'role': 'client'
        ,
          type: 'tags', values: 'role': 'worker' # HBase RegionServer
        ,
          type: 'nodes', match: 'any', values: ['master01.metal.ryba', 'master02.metal.ryba'] # HBase Master
        ]
    'ryba/phoenix/queryserver':
      affinity: type: 'nodes', values: ['master03.metal.ryba']
    # # 'ryba/opentsdb':
    # #   affinity: type: 'nodes', values: ['master03.metal.ryba']
    'ryba/flume':
      affinity: type: 'tags', values: 'role': 'client'
      options:
        libs: []
    'ryba/hive/metastore':
      options:
        db: password: 'Hive123!'
    'ryba/hive/hcatalog':
      affinity: type: 'nodes', match: 'any', values: ['master02.metal.ryba', 'master03.metal.ryba']
      options:
        user: limits:
          nproc: 16384
          nofile: 16384
    'ryba/hive/server2':
      affinity: type: 'nodes', match: 'any', values: ['master01.metal.ryba', 'master02.metal.ryba']
    'ryba/ranger/plugins/hiveserver2':
      affinity: type: 'nodes', match: 'any', values: ['master01.metal.ryba', 'master02.metal.ryba']
    'ryba/hive/webhcat':
      affinity: type: 'nodes', values: ['master03.metal.ryba']
    'ryba/hive/client':
      affinity: type: 'tags', values: 'role': 'client'
    'ryba/hive/beeline':
      affinity: type: 'tags', values: 'role': 'client'
    'ryba/pig':
      affinity: type: 'tags', values: 'role': 'client'
    'ryba/sqoop':
      affinity: type: 'tags', values: 'role': 'client'
      options:
        libs: []
    'ryba/oozie/server':
      affinity: type: 'nodes', values: ['master03.metal.ryba']
      options:
        db:
          password: 'Oozie123!'
    'ryba/oozie/client':
      affinity: type: 'tags', values: 'role': 'client'
    # 'ryba/mongodb/repo':
    #   affinity: type: 'tags', values: 'role': 'master'
    # 'ryba/mongodb/configsrv':
    #   affinity: type: 'tags', values: 'role': 'master'
    #   options:
    #     replicaset: 'configSrvReplicatSet01'
    #     admin:
    #       name: 'admin'
    #       password: 'admin123'
    #     root:
    #       name: 'root_admin'
    #       password: 'root123'
    # Kafka
    'ryba/kafka/broker':
      affinity: type: 'tags', values: 'role': 'master'
      options:
        heapsize: 256
        # protocols: [
        #   'SASL_SSL'
        #   'SASL_PLAINTEXT'
        #   'PLAINTEXT'
        #   'SSL'
        # ]
        admin:
          password: 'kafka123'
        config:
          'ssl.keystore.password': 'KafkaKeystore!'
          'ssl.truststore.password': 'KafkaTruststore!'
    'ryba/kafka/client':
      affinity: type: 'tags', values: 'role': 'client'
    'ryba/ranger/plugins/kafka':
      affinity: type: 'tags', values: 'role': 'master'
    # Druid
    'ryba/druid/base':
      options:
        db: password: 'Druid123-'
    'ryba/druid/broker':
      affinity: type: 'tags', values: 'role': 'master'
      options:
        runtime:
          'druid.processing.numThreads': 1
          'druid.processing.buffer.sizeBytes': '134217728' # 128Go
        jvm:
          xms: '128m'
          xmx: '512m'
    'ryba/druid/coordinator':
      affinity: type: 'tags', values: 'role': 'worker'
      options:
        jvm:
          xms: '128m' # Default is 3g
          xmx: '512m' # Default is 3g
    'ryba/druid/overlord':
      affinity: type: 'tags', values: 'role': 'worker'
      options:
        jvm:
          xms: '128m' # Default is 3g
          xmx: '512m' # Default is 3g
    'ryba/druid/historical':
      affinity: type: 'tags', values: 'role': 'worker'
      options:
        runtime:
          'druid.processing.numThreads': 1
          'druid.processing.buffer.sizeBytes': '134217728' # 128Go
        jvm:
          xms: '128m' # Default is 8g
          xmx: '512m' # Default is 8g
    'ryba/druid/middlemanager':
      affinity: type: 'tags', values: 'role': 'worker'
      options:
        runtime:
          'druid.processing.numThreads': 1
          'druid.processing.buffer.sizeBytes': '134217728' # 128Go
    # # ElasticSearch
    # # 'ryba/elasticsearch':
    # #   affinity: type: 'tags', values: 'role': 'worker'
    # # 'ryba/solr/cloud_docker':
    # #   affinity: type: 'tags', values: 'role': 'worker'
    # # Hue
    # 'ryba/huedocker':
    #   affinity: type: 'tags', values: 'role': 'client'
    #   options:
    #     db: password: 'hue1234!-'
    # # Knox
    # # 'ryba/knox':
    # #   affinity: type: 'tags', values: 'role': 'client'
    # #   options:
    # #     topologies:
    # #       ryba_users:
    # #         userDnTemplate:'cn={0},ou=users,dc=ryba'
    # #         ldap_search_base: 'ou=users,dc=ryba'
    # #         ldap_uri: 'ldaps://master03.metal.ryba:636'
    # #         ldap_tls_cacertdir: '/etc/openldap/cacerts'
    # #         ldap_default_bind_dn: 'cn=ldapadm,dc=ryba'
    # #         ldap_default_authtok: 'test'
    # #         group:
    # #           lookup: 'domain/clients'
    # #           groupObjectClass: 'posixGroup'
    # #           memberAttribute: 'memberUId'
    # #         services:
    # #           namenode: true
    # #           jobtracker: true
    # #           webhdfs: true
    # #           hive: true
    # #           webhcat: true
    # #           oozie: true
    # #           webhbase: true
    # 'ryba/ranger/plugins/knox':
    #   affinity: type: 'nodes', values: ['edge01.metal.ryba']
    # 'ryba/knox/client':
    #   affinity: type: 'tags', values: 'role': 'client'
    # 'ryba/knox/server':
    #   affinity: type: 'tags', values: 'role': 'client'
    #   options:
    #     test:
    #       user:
    #         name: 'test_user_ryba'
    #         password: 'test'
    #     topologies:
    #       ryba_users:
    #         services:
    #           namenode: true
    #           jobtracker: true
    #           webhdfs: true
    #           hive: true
    #           webhcat: true
    #           oozie: true
    #           webhbase: true
    #         realms:
    #           'ldapRealm':
    #               userDnTemplate:'cn={0},ou=users,dc=ryba'
    #               ldap_search_base: 'ou=users,dc=ryba'
    #               ldap_uri: 'ldaps://master03.metal.ryba:636'
    #               ldap_tls_cacertdir: '/etc/openldap/cacerts'
    #               ldap_default_bind_dn: 'cn=ldapadm,dc=ryba'
    #               ldap_default_authtok: 'test'
    #               userSearchBase: 'ou=users,dc=ryba'
    #               groupSearchBase: 'ou=groups,dc=ryba'
    #               groupObjectClass: 'posixGroup'
    #               memberAttribute: 'memberUId'
    #           'ldapGroupRealm':
    #               sssd_lookup: 'domain/users'
    #               userDnTemplate:'cn={0},ou=users,dc=ryba'
    #               ldap_search_base: 'ou=users,dc=ryba'
    #               ldap_uri: 'ldaps://master03.metal.ryba:636'
    #               ldap_tls_cacertdir: '/etc/openldap/cacerts'
    #               ldap_default_bind_dn: 'cn=ldapadm,dc=ryba'
    #               ldap_default_authtok: 'test'
    #               groupObjectClass: 'posixGroup'
    #               userSearchBase: 'ou=groups,dc=ryba'
    #               memberAttribute: 'memberUId'
    # Hue
    'ryba/huedocker':
      affinity: type: 'tags', values: 'role': 'client'
      options:
        db: password: 'Hue123-'
        version: '4.1.0'
        container: 'hue_server'
        image_dir: '/var/lib/docker_images'
        cache_dir: "#{__dirname}/../cache"
        service: 'hue-server-docker'
        ini:
          'desktop':
            'smtp': 'host': 'mailhost.der.edf.fr'
            'database':
              'engine': 'mysql'
              'user': 'hue'
              'password': 'Ryba4MysqlHue'
    # # Nifi
    # # 'ryba/nifi':
    # #   affinity: type: 'tags', values: 'role': 'worker'
    # #   options:
    # #     config:
    # #       properties:
    # #         'nifi.security.identity.mapping.pattern.dn': '^EMAILADDRESS=(.*?), CN=(.*?),(.*)$'
    # #         'nifi.security.identity.mapping.value.dn': '$2'
    # # MongoDB
    # # 'ryba/mongodb/configsrv':
    # #   affinity: type: 'tags', values: 'role': 'master'
    # #   options:
    # #     admin:
    # #       name: 'admin'
    # #       password: 'admin123'
    # #     root:
    # #       name: 'root_admin'
    # #       password: 'root123'
    # # 'ryba/mongodb/router':
    # #   affinity: type: 'nodes', match: 'any', values: ['master02.metal.ryba', 'master03.metal.ryba']
    # #   # options:
    # #   #   mongo_router_for_configsrv: 'configsrvRepSet1'
    # # 'ryba/mongodb/shard':
    # #   affinity: type: 'tags', values: 'role': 'worker'
    # # 'ryba/elasticsearch':
    # #   affinity: type: 'tags', values: 'role': 'worker'
    'ryba/spark/client':
      affinity: type: 'tags', values: 'role': 'client'
    # 'ryba/zeppelin':
    #   affinity: type: 'tags', values: 'role': 'client'
    # # 'ryba/nagios':
    # #   constrains: nodes: ['master03.metal.ryba']
    # #   options:
    # #     users:
    # #       nagiosadmin:
    # #         password: 'nagios123'
    # #         alias: 'Nagios Admin'
    # #         email: ''
    # #       guest:
    # #         password: 'guest123'
    # #         alias: 'Nagios Guest'
    # #         email: ''
    # #     groups:
    # #       admins:
    # #         alias: 'Nagios Administrators'
    # #         members: ['nagiosadmin','guest']
  nodes:
    'master01.metal.ryba':
      ip: '10.10.10.11'
      tags:
        'environment': 'dev'
        'role': 'master'
      services:
        'vagrant:masson/core/ssl':
          'cert': source: "#{__dirname}/certs/master01.cert.pem", local: true
          'key': source: "#{__dirname}/certs/master01.key.pem", local: true
        'vagrant:masson/core/krb5_server':
          admin:
            'HADOOP.RYBA':
              master: true
        # 'vagrant:ryba/mongodb/configsrv':
        #   is_master: true
    'master02.metal.ryba':
      ip: '10.10.10.12'
      tags:
        'environment': 'dev'
        'role': 'master'
      services:
        'vagrant:masson/core/ssl':
          'cert': source: "#{__dirname}/certs/master02.cert.pem", local: true
          'key': source: "#{__dirname}/certs/master02.key.pem", local: true
        'vagrant:masson/core/openldap_server':
          tls_cert_file: "#{__dirname}/certs/master02.cert.pem"
          tls_key_file: "#{__dirname}/certs/master02.key.pem"
    'master03.metal.ryba':
      ip: '10.10.10.13'
      tags:
        'environment': 'dev'
        'role': 'master'
      services:
        'vagrant:masson/core/ssl':
          'cert': source: "#{__dirname}/certs/master03.cert.pem", local: true
          'key': source: "#{__dirname}/certs/master03.key.pem", local: true
        'vagrant:masson/core/openldap_server':
          tls_cert_file: "#{__dirname}/certs/master03.cert.pem"
          tls_key_file: "#{__dirname}/certs/master03.key.pem"
    'edge01.metal.ryba':
      ip: '10.10.10.14'
      tags:
        'environment': 'dev'
        'role': 'client'
      services:
        'vagrant:masson/core/ssl':
          'cert': source: "#{__dirname}/certs/edge01.cert.pem", local: true
          'key': source: "#{__dirname}/certs/edge01.key.pem", local: true
    'worker01.metal.ryba':
      rack: 1
      ip: '10.10.10.16'
      tags:
        'environment': 'dev'
        'role': 'worker'
      services:
        'vagrant:masson/core/ssl':
          'cert': source: "#{__dirname}/certs/worker01.cert.pem", local: true
          'key': source: "#{__dirname}/certs/worker01.key.pem", local: true
    'worker02.metal.ryba':
      rack: 2
      ip: '10.10.10.17'
      tags:
        'environment': 'dev'
        'role': 'worker'
      services:
        'vagrant:masson/core/ssl':
          'cert': source: "#{__dirname}/certs/worker02.cert.pem", local: true
          'key': source: "#{__dirname}/certs/worker02.key.pem", local: true
    'worker03.metal.ryba':
      rack: 2
      ip: '10.10.10.18'
      tags:
        'environment': 'dev'
        'role': 'worker'
      services:
        'vagrant:masson/core/ssl':
          'cert': source: "#{__dirname}/certs/worker03.cert.pem", local: true
          'key': source: "#{__dirname}/certs/worker03.key.pem", local: true
