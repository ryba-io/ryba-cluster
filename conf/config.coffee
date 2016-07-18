
module.exports =
  mecano:
    domain: true
    # cache: false
    cache_dir: "#{__dirname}/../resources/cache"
    log_serializer: true
  log: archive: true
  security:
    selinux: false
    limits: {}
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
  ssh:
    banner:
      target: '/etc/banner'
      content: "Welcome to Hadoop!"
    sshd_config:
      PermitRootLogin: 'without-password'
  users:
    'root':
      authorized_keys:  []
  yum:
    packages: 'tree': true, 'git': true, 'htop': true, 'vim': true, 'bash-completion': true
  mysql:
    server:
      current_password: ''
      password: 'test123'
      my_cnf: mysqld: innodb_file_per_table: '1'
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
    tls_cert_file: "#{__dirname}/certs/master3_cert.pem"
    tls_key_file: "#{__dirname}/certs/master3_key.pem"
  openldap_client:
    certificates: [ # Same as "sssd.certificates"
      "#{__dirname}/certs/master3_cert.pem"
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
  java:
    jce_local_policy: "#{__dirname}/../resources/java/jce_policy-7/local_policy.jar"
    jce_us_export_policy: "#{__dirname}/../resources/java/jce_policy-7/US_export_policy.jar"
    java_home: '/usr/java/default/'
    jre_home: '/usr/java/default/jre'
    jdk:
      version: '1.7.0_79'
      location: "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz"
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
      site:
        'javax.jdo.option.ConnectionDriverName': 'com.mysql.jdbc.Driver'
        'javax.jdo.option.ConnectionUserName': 'hive'
        'javax.jdo.option.ConnectionPassword': 'hive123'
        # 'hive.server2.transport.mode': 'http' # Carefull, beeline client stop working
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
      rs: opts: '-Xmx512m'
      admin:
        password: 'hbase123'
      metrics:
        '*.sink.file.class': 'org.apache.hadoop.metrics2.sink.FileSink'
    kafka:
      broker:
        heapsize: 128
        # protocols: [
        #   'SASL_SSL'
        #   'SASL_PLAINTEXT'
        #   'PLAINTEXT'
        #   'SSL'
        # ]
    opentsdb: version: '2.2.0RC3'
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
      version: '0.6.1'
      source: 'http://apache.crihan.fr/dist/nifi/0.6.1/nifi-0.6.1-bin.tar.gz'
      # source: 'http://public-repo-1.hortonworks.com/HDF/centos6/1.x/updates/1.2.0.0/HDF-1.2.0.0-91.tar.gz'
      manager:
        config:
          properties:
            'nifi.security.user.login.identity.provider': 'kerberos-provider'
          authorized_users: [
            dn: 'nifi@HADOOP.RYBA'
            roles: ['ROLE_ADMIN']
          ,
            dn: 'solr@HADOOP.RYBA'
            roles: ['ROLE_ADMIN', 'ROLE_DFM', 'ROLE_NIFI']
          ]
