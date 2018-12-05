
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
      root:
        username: 'vagrant'
        private_key_path: "#{require('os').homedir()}/.vagrant.d/insecure_private_key"
        public_key: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsEMW3nRo32N8gnrb2lEYgwDV8Ixv1HJMe30D6PHcU6wg60mx5oEim/3x2tsVVRGv5xSz8KuAZWTmTY0h6LPRsbg41XmdPDHfzPkLOotvtSvJlLeJr9NLXh9Y7G9ZNFHbtHvV49f3Qb9khF4oV5Ou5zD3L0+X7EDOyZ5uVHAsHG/9JYFdRqLaYcBlp6OUb10aSf1/af6g+ZuCTqSsswKMuGU0GeR2ugE1JcYD17As8UXjLnhCQGqYbd4vMKoAoDPDInk+nJu00YBZ83zWBj8/ksHMLrpZ20TOnCxgC/XAKKiqCC2DFVk3azRqPFCsLFqFGRey0EjYgNybapRPFoNtT Ryba Hadoop'
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
    # 'ryba-k8s/packages':
    #   affinity: type: 'nodes', match: 'any', values: ['master01.metal.ryba']
    #   options:
    #     offline: true
    # 'ryba-k8s/kubeadm':
    #   affinity: type: 'nodes', match: 'any', values: ['master01.metal.ryba']
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
        # resolv: """
        #   search metal.ryba
        #   nameserver 10.10.10.13
        #   nameserver 10.0.2.3
        #   """
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
        state: 'stop'
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
          version: '1.8.0_172'
          versions:
            '1.8.0_172':
              jdk_location: 'http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.tar.gz'
              jce_location: 'http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip'
    'masson/commons/git':
      affinity: type: 'tags', values: 'environment': 'dev'
      options:
        users:
          'ryba': config:
            "user": { "name": 'Ryba User', email: "ryba@ryba.io" }
    'masson/commons/docker':
      affinity: type: 'tags', values: 'environment': 'dev'
    'ryba/hdp':
      affinity: type: 'tags', values: 'environment': 'dev'
      options:
        source: 'http://public-repo-1.hortonworks.com/HDP/centos7/3.x/updates/3.0.0.0/hdp.repo'
    'ryba/zookeeper/server':
      affinity: type: 'tags', values: 'role': 'master'
      options:
        clean_logs: true
        heapsize: '256m'
    'ryba/zookeeper/client':
      affinity: type: 'tags', values: 'role': 'client'
    'ryba/esdocker':
      affinity: type: 'tags', values: 'role': match: 'any', values: ['worker']
      options:
        swarm_manager: "tcp://pcyyykk8.pcy.edfgdf.fr:3376"
        clusters:
          "test_dev_metal":
            only: true
            es_version: "5.3.1" #inherit
            multiple_node: true
            number_of_shards: 1 #inherit
            number_of_replicas: 2 #inherit
            number_of_containers: 3 #--> a voir
            logs_path: "/var/hadoop_log/docker/es" ##inherit ou override
            plugins_path: "/etc/elasticsearch/plugins" #commons
            plugins: ['repository-s3'] #commons
            net: 'host'
            # ports: ["29214:9200","29314:9300"] #inherit , --> multiple
            nodes:
              'master_data':
                filter: 'worker0*'
                cpuset: "4-5",
                mem_limit: '16g'
                heap_size: '8g'
                http_port: '9201'
                tcp_port: '9301'
                data_path: ["/data/1","/data/2"]
              '1st_data':
                number: 3
                net: 'host'
                filter: 'worker0*'
                cpuset: "4-5",
                mem_limit: '16g'
                heap_size: '8g'
                http_port: '9202'
                tcp_port: '9302'
                data_path: ["/data/1","/data/2"]
              '2nd_data':
                number: 3
                net: 'host'
                filter: 'worker0*'
                cpuset: "4-5",
                mem_limit: '16g'
                heap_size: '8g'
                http_port: '9203'
                tcp_port: '9303'
                data_path: ["/data/1","/data/2"]
          "env_metal_dev":
            only: true
            es_version: "5.6.2"
            number_of_shards: 1
            number_of_replicas: 2
            number_of_containers: 3
            data_path: ["/data/1","/data/2"]
            logs_path: "/var/log/docker/es"
            plugins_path: "/etc/elasticsearch/plugins"
            plugins: ['repository-s3']
            ports: ["29214:9200","29314:9300"]
            nodes:
              master_data:
                number: 3
                cpuset: "4-5",
                mem_limit: '1g'
                heap_size: '1g'
            network:
              name: "env_metal_dev"
  nodes:
    'master01.metal.ryba':
      ip: '10.10.10.11'
      rack: 1
      tags:
        'environment': 'dev'
        'role': 'master'
        'name': 'master1'
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
      rack: 2
      tags:
        'environment': 'dev'
        'role': 'master'
        'name': 'master2'
      services:
        'vagrant:masson/core/ssl':
          'cert': source: "#{__dirname}/certs/master02.cert.pem", local: true
          'key': source: "#{__dirname}/certs/master02.key.pem", local: true
        'vagrant:masson/core/openldap_server':
          tls_cert_file: "#{__dirname}/certs/master02.cert.pem"
          tls_key_file: "#{__dirname}/certs/master02.key.pem"
    'master03.metal.ryba':
      ip: '10.10.10.13'
      rack: 3
      tags:
        'environment': 'dev'
        'role': 'master'
        'name': 'master3'
      services:
        'vagrant:masson/core/ssl':
          'cert': source: "#{__dirname}/certs/master03.cert.pem", local: true
          'key': source: "#{__dirname}/certs/master03.key.pem", local: true
        'vagrant:masson/core/openldap_server':
          tls_cert_file: "#{__dirname}/certs/master03.cert.pem"
          tls_key_file: "#{__dirname}/certs/master03.key.pem"
    'edge01.metal.ryba':
      ip: '10.10.10.14'
      rack: 1
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
        # 'vagrant:ryba-ambari-takeover/hadoop/hdfs':
        #   groups: ['worker_hdfs_type01']
        # 'vagrant:ryba-ambari-takeover/hadoop/yarn':
        #   groups: ['worker_yarn_type01']
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
        # 'vagrant:ryba-ambari-takeover/hadoop/hdfs':
        #   groups: ['worker_hdfs_type01']
        # 'vagrant:ryba-ambari-takeover/hadoop/yarn':
        #   groups: ['worker_yarn_type01']
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
        # 'vagrant:ryba-ambari-takeover/hadoop/hdfs':
        #   groups: ['worker_hdfs_type01']
        # 'vagrant:ryba-ambari-takeover/hadoop/yarn':
        #   groups: ['worker_yarn_type01']
