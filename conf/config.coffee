
module.exports =
  ssh:
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
      private_key_path: "~/.vagrant.d/insecure_private_key"
  nikita:
    domain: true
    cache_dir: "#{__dirname}/../cache"
    log_serializer: true
    debug: false
  log:
    archive: true
    rotate: true
  system:
    selinux: false
    limits: {}
    users: {}
      # 'root': 
      #   authorized_keys: []
  network:
    hosts_auto: true
    hosts:
      '127.0.0.1': 'localhost localhost.localdomain localhost4 localhost4.localdomain4'
      '10.10.10.10': 'repos.ryba ryba'
    resolv: """
      search ryba
      nameserver 10.10.10.13
      nameserver 10.0.2.3
      """
  iptables:
    action: 'stop'
    startup: false
    log: true
    rules: [
      # { chain: 'INPUT', jump: 'ACCEPT', source: "10.10.10.0/24", comment: 'Local Network' }
    ]
  bind_server:
    zones: [
      "#{__dirname}/zones/ryba"
      "#{__dirname}/zones/10.10.10.in-addr.arpa"
    ]
  # ssh:
  #   banner:
  #     target: '/etc/banner'
  #     content: "Welcome to Hadoop!"
  #   sshd_config:
  #     PermitRootLogin: 'without-password'
  yum:
    packages: 'tree': true, 'git': true, 'htop': true, 'vim': true, 'bash-completion': true, 'unzip': true
  mysql:
    server:
      current_password: ''
      password: 'test123'
      my_cnf: mysqld: innodb_file_per_table: '1'
  postgres:
    server:
      password: 'test123'
      user: 'root'
  openldap_server:
    suffix: 'dc=ryba'
    root_dn: 'cn=Manager,dc=ryba'
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
  openldap_client:
    certificates: [ # Same as "sssd.certificates"
      name: "#{__dirname}/certs/master3_cert.pem", local: true
    ]
    config: {}
  openldap_server_krb5:
    manager_dn: 'cn=Manager,dc=ryba' # Manager must have write access to "kerberos_dn"
    manager_password: 'test'
    # kerberos_dn: 'ou=kerberos,dc=ryba'
    # groups_dn: 'cn=krbadmin,ou=groups,dc=ryba'
    # users_dn: 'cn=krbadmin,ou=users,dc=ryba'
    krbadmin_user:
      mail: 'david@adaltas.com'
      userPassword: 'test' #test
  krb5:
    etc_krb5_conf:
      libdefaults:
        default_realm: 'HADOOP.RYBA'
      # realms:
      #   'HADOOP.RYBA':
      #     default_domain: 'ryba'
      #   'USERS.RYBA':
      #     default_domain: 'ryba'
      domain_realm:
        # '.ryba': 'HADOOP.RYBA'
        'ryba': 'HADOOP.RYBA'
    kdc_conf:
      realms: {}
  sssd:
    # test_user: 'ryba'
    force_check: false
    certificates: [
      "#{__dirname}/certs/cacert.pem"
    ]
    config:
      'domain/hadoop':
        'debug_level': '1'
        'cache_credentials' : 'True'
        'ldap_search_base' : 'ou=users,dc=ryba'
        'ldap_group_search_base' : 'ou=groups,dc=ryba'
        'id_provider' : 'ldap'
        'auth_provider' : 'ldap'
        'chpass_provider' : 'ldap'
        'ldap_uri' : 'ldaps://master3.ryba:636'
        'ldap_tls_cacertdir' : '/etc/openldap/cacerts'
        # 'ldap_default_bind_dn' : 'cn=nssproxy,dc=ryba'
        'ldap_default_bind_dn' : 'cn=Manager,dc=ryba'
        'ldap_default_authtok' : 'test'
        'ldap_id_use_start_tls' : 'True'
      'domain/users':
        'debug_level': '1'
        'cache_credentials' : 'True'
        'ldap_search_base' : 'ou=users,dc=ryba'
        'ldap_group_search_base' : 'ou=groups,dc=ryba'
        'id_provider' : 'ldap'
        'auth_provider' : 'ldap'
        'chpass_provider' : 'ldap'
        'ldap_uri' : 'ldaps://master3.ryba:636'
        'ldap_tls_cacertdir' : '/etc/openldap/cacerts'
        # 'ldap_default_bind_dn' : 'cn=nssproxy,dc=ryba'
        'ldap_default_bind_dn' : 'cn=Manager,dc=ryba'
        'ldap_default_authtok' : 'test'
        'ldap_id_use_start_tls' : 'False'
      'sssd':
        'domains' : 'hadoop,users'
  ryba:
    clean_logs: true
    force_check: false
    check_hdfs_fsck: false
    security: 'kerberos'
    realm: 'HADOOP.RYBA'
    nameservice: 'torval'
    krb5_user: # User used for testing
      password: 'test123'
      password_sync: true
    ssl:
      'cacert': "#{__dirname}/certs/cacert.pem"
    #   'cert': "#{__dirname}/certs/hadoop_cert.pem"
    #   'key': "#{__dirname}/certs/hadoop_key.pem"
    ambari:
      repo: "#{__dirname}/resources/repos/ambari-2.0.0.repo"
    mongodb:
      admin:
        name: 'admin'
        password: 'admin123'
      root:
        name: 'root_admin'
        password: 'root123'
    ssh_fencing:
      private_key: "#{__dirname}/hdfs_keys/id_rsa"
      public_key: "#{__dirname}/hdfs_keys/id_rsa.pub"
    hadoop_opts: '-Djava.net.preferIPv4Stack=true -Dsun.security.krb5.debug=false'
    core_site:
      'hadoop.ssl.exclude.cipher.suites': 'SSL_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA,SSL_RSA_EXPORT_WITH_DES40_CBC_SHA,SSL_RSA_EXPORT_WITH_RC4_40_MD5,TLS_DHE_RSA_WITH_AES_128_CBC_SHA,TLS_DHE_RSA_WITH_AES_256_CBC_SHA'
      #'hadoop.proxyuser.flume.groups': '*'
      #'hadoop.proxyuser.flume.hosts': '*'
      # 'hadoop.security.auth_to_local': """
      #
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
    hdfs:
      user: limits:
        nproc: 16384
        nofile: 16384
      krb5_user:
        password: 'hdfs123'
        password_sync: true
      sysctl:
        'vm.swappiness': 0 # Default to 60
        'vm.overcommit_memory': 1 # Default to 0
        'vm.overcommit_ratio': 100 # Default to 50
        'net.core.somaxconn': 1024 # Default to 128
        'net.ipv4.ip_local_port_range': '10000 65000' # Default is "1024 4999"
      site:
        'dfs.namenode.safemode.extension': 1000 # "1s", default to "30s"
    zkfc:
      digest:
        name: 'zkfc'
        password: 'zkfc123'
    yarn:
      user: limits:
        nproc: 16384
        nofile: 16384
      opts: '-Dsun.net.spi.nameservice.provider.1=sun,dns' # HADOOP_JAAS_DEBUG=true
      site: {}
    capacity_scheduler:
      'yarn.scheduler.capacity.maximum-am-resource-percent': '.5'
    mapred:
      user: limits:
        nproc: 16384
        nofile: 16384
      site:
        'mapreduce.job.counters.max': '10000'
        'mapreduce.job.counters.limit': '10000'
    hive:
      user: limits:
        nproc: 16384
        nofile: 16384
      # hcatalog:
      #   db:
      #     database ?= 'hive'
      #     username ?= 'hive'
      #     password ?= 'hive123'
      #   site:
      #     'hive.server2.transport.mode': 'http' # Carefull, beeline client stop working
    hue:
      ini:
        desktop:
          smtp: host: ''
          database:
            engine: 'mysql'
            password: 'hue123'
      ssl:
        certificate: "#{__dirname}/certs/master3_cert.pem"
        private_key: "#{__dirname}/certs/master3_key.pem"
        client_ca: "#{__dirname}/certs/cacert.pem"
    hue_docker:
      ini:
        desktop:
          smtp: host: ''
          database:
            engine: 'mysql'
            password: 'hue123'
      ssl:
        client_ca: "#{__dirname}/certs/cacert.pem"
    sqoop: libs: []
    hbase:
      user: limits:
        nproc: 16384
        nofile: 16384
      admin:
        password: 'hbase123'
      metrics:
        '*.sink.file.class': 'org.apache.hadoop.metrics2.sink.FileSink'
    kafka:
      broker:
        heapsize: 256
        # protocols: [
        #   'SASL_SSL'
        #   'SASL_PLAINTEXT'
        #   'PLAINTEXT'
        #   'SSL'
        # ]
    nagios:
      users:
        nagiosadmin:
          password: 'nagios123'
          alias: 'Nagios Admin'
          email: ''
        guest:
          password: 'guest123'
          alias: 'Nagios Guest'
          email: ''
      groups:
        admins:
          alias: 'Nagios Administrators'
          members: ['nagiosadmin','guest']
    nifi:
      config:
        properties:
          'nifi.security.identity.mapping.pattern.dn': '^EMAILADDRESS=(.*?), CN=(.*?),(.*)$'
          'nifi.security.identity.mapping.value.dn': '$2'
    druid:
      broker: jvm:
        xms: '128m'
        xmx: '512m'
      coordinator: jvm:
        xms: '128m' # Default is 3g
        xmx: '512m' # Default is 3g
      historical: jvm:
        xms: '128m' # Default is 8g
        xmx: '512m' # Default is 8g
      overlord: jvm:
        xms: '128m' # Default is 3g
        xmx: '512m' # Default is 3g
