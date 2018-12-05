
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
    'masson/core/locale':
      affinity: type: 'tags', values: 'environment': 'dev'
    'masson/commons/httpd':
      affinity: type: 'nodes', values: ['master03.metal.ryba']
    # MongoDB
    'ryba/mongodb/repo':
      affinity: type: 'tags', values: 'role': 'master'
    'ryba/mongodb/configsrv':
      affinity: type: 'tags', values: 'role': 'master'
      options:
        replicaset: 'configSrvReplicatSet01'
        admin:
          name: 'admin'
          password: 'admin123'
        root:
          name: 'root_admin'
          password: 'root123'
    'ryba/mongodb/router':
      affinity: type: 'nodes', match: 'any', values: ['master02.metal.ryba', 'master03.metal.ryba']
      options:
        mongo_router_for_configsrv: 'configsrvRepSet1'
    'ryba/mongodb/shard':
      affinity: type: 'tags', values: 'role': 'worker'
      options:
        replicaset: 'ShardSrvReplicatSet01'
        admin:
          name: 'admin'
          password: 'admin123'
        root:
          name: 'root_admin'
          password: 'root123'
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
        'vagrant:ryba/mongodb/configsrv':
          is_master: true
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
