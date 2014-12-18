
module.exports =
  security:
    selinux: false
    limits: {}
  network:
    hosts_auto: true
    hosts:
      '127.0.0.1': 'localhost localhost.localdomain localhost4 localhost4.localdomain4'
      '10.10.10.10': 'repos.ryba ryba'
    resolv: """
      search hadoop
      nameserver 10.10.10.13
      nameserver 10.0.2.3
      """
  iptables:
    action: 'stop'
    startup: false
    log: true
    rules: [
      { chain: 'INPUT', jump: 'ACCEPT', source: "10.10.10.0/24", comment: 'Local Network' }
    ]
  bind_server:
    zones: [
      "#{__dirname}/zones/ryba"
      "#{__dirname}/zones/10.10.10.in-addr.arpa"
    ]
  yum:
    clean: true
    epel: false
  ssh:
    banner:
      destination: '/etc/banner'
      content: "Welcome to Hadoop!"
    sshd_config:
      PermitRootLogin: 'without-password'
  users:
    'root':
      authorized_keys:  [
        'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAuYziVgwFAXvExxIj5HgAywFeSfu9zxoLc5bCdeJhS/gh4EtpMN0McHd21M4btuopMAL/sctT4+SiBqwOIERw0rGWrat4WE2qBReEc+6hvdoiUx+7WglDCYePbV91N+x421UYzHhNPUg62jXIfg+o5zG/tdEDbpBAq2EX3vRsncenlhB+p/LsSkY+2+tBJLW172BN1ncKjImFglMwW+7OxGP2U9LoMMFyUs1zS65p8WgHHi/+6ZNsP0wIhKPPl8BiFJ6dLiNjlRuXLX9fGcQDJGrlYbad5Thb5wpQe1EZCF9qBloUkdj7aTIu+dainTP/I87Eo2Y47KsSydvopjqceQ== david@adaltas.com'
        'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAyg1YL/YQBrsWAoqkJl4ZvohdLPXMbyXbiR7Xx7RB+JENkqKYQCAFds+3DKTol4neZHAd/eGzjFTB/Bc/U+TiUDsWlpWSeg5lmoR4wcwt7a7Y1jcdArEUSvhS48b+FQ3xs0Km9d/jbo90GiZ1NTGQb7Hb43Lew/0C58Lq1ds/qIRqQKQCwW5VD+rmsYJf9GCfN51llqYyCw3WogGER5NqG8Uz5bQp2mIJFmkKOVtdSgmcn5X9lH5mO7vR1mspbAuRdS0xqRh6tJg2+unFAaICbw9AkSP/KMOElMuR62CPeTu2it+1LyJoDOXDYFXfgr1RH+mU1LoId7emrsypbutOdw== tifcherif@gmail.com'
      ]
  mysql_server:
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
    certificates: [
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
      domain_realm:
        '.ryba': 'HADOOP.ADALTAS.COM'
        'ryba': 'HADOOP.ADALTAS.COM'
      realms:
        'HADOOP.RYBA':
          # default_domain: 'adaltas.com'
          default_domain: 'hadoop'
        'USERS.RYBA':
          # default_domain: 'adaltas.com'
          default_domain: 'hadoop'
      capaths:
        'HADOOP.RYBA':
          'USERS.RYBA': '.'
        'USERS.RYBA':
          'HADOOP.RYBA': '.'
      domain_realm:
        '.ryba': 'HADOOP.RYBA'
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
  java: {}
    # java_home: '/usr/bin/java' # OpenJDK, default
    # java_home: '/usr/java/default' # Oracle JDK
    # jdk:
    #   version: '1.7.0_60'
    #   location: "#{__dirname}/../resources/java/jdk-7u60-linux-x64.tar.gz"
    # jce_local_policy: "#{__dirname}/../resources/java/jce_policy-7/local_policy.jar"
    # jce_us_export_policy: "#{__dirname}/../resources/java/jce_policy-7/US_export_policy.jar"
  ryba:
    clean_logs: true
    check: true
    force_check: false
    static_host: false
    security: 'kerberos'
    realm: 'HADOOP.RYBA'
    nameservice: 'torval'
    ssl:
      'cacert': "#{__dirname}/certs/cacert.pem"
    #   'cert': "#{__dirname}/certs/hadoop_cert.pem"
    #   'key': "#{__dirname}/certs/hadoop_key.pem"
    ssh_fencing:
      private_key: "#{__dirname}/hdfs_keys/id_rsa"
      public_key: "#{__dirname}/hdfs_keys/id_rsa.pub"
    zkfc_password: 'hdfs123'
    hadoop_opts:
      'java.net.preferIPv4Stack': 'true'
      'sun.security.krb5.debug': 'false'
    yarn_opts:
      'HADOOP_JAAS_DEBUG': 'true'
      'sun.net.spi.nameservice.provider.1': 'dns,sun'
    core_site:
      'hadoop.proxyuser.hcat.groups': '*'
      'hadoop.proxyuser.hcat.hosts': '*'
      'hadoop.proxyuser.hue.hosts': '*'
      'hadoop.proxyuser.hue.groups': '*'
      'hadoop.proxyuser.flume.groups': '*'
      'hadoop.proxyuser.flume.hosts': '*'
      'hadoop.security.auth_to_local': """
      
            RULE:[2:$1@$0]([rn]m@.*)s/.*/yarn/
            RULE:[2:$1@$0](jhs@.*)s/.*/mapred/
            RULE:[2:$1@$0]([nd]n@.*)s/.*/hdfs/
            RULE:[2:$1@$0](hm@.*)s/.*/hbase/
            RULE:[2:$1@$0](rs@.*)s/.*/hbase/
            RULE:[1:$1@$0](^.*@HADOOP\\.RYBA$)s/^(.*)@HADOOP\\.RYBA$/$1/g
            RULE:[2:$1@$0](^.*@HADOOP\\.RYBA$)s/^(.*)@HADOOP\\.RYBA$/$1/g
            RULE:[1:$1@$0](^.*@USERS\\.RYBA$)s/^(.*)@USERS\\.RYBA$/$1/g
            RULE:[2:$1@$0](^.*@USERS\\.RYBA$)s/^(.*)@USERS\\.RYBA$/$1/g
            DEFAULT

      """
    hdfs_password: 'hdfs123'
    test_password: 'test123'
    # hdfs_site:
    #   'dfs.http.policy': 'HTTP_AND_HTTPS'
    yarn_site:
      'yarn.scheduler.maximum-allocation-mb': '1800' # Should not exceed vm memory or no worker will be able to get a container
      'yarn.scheduler.minimum-allocation-mb': '1000' # Avoid "$host doesn't satisfy minimum allocations" with small vms
      'yarn.resourcemanager.recovery.enabled': 'true'
    mapred_site:
      'mapreduce.job.counters.max': '10000'
      'mapreduce.job.counters.limit': '10000'
    hive_site:
      'javax.jdo.option.ConnectionDriverName': 'com.mysql.jdbc.Driver'
      'javax.jdo.option.ConnectionUserName': 'hive'
      'javax.jdo.option.ConnectionPassword': 'hive123'
      # 'hive.server2.transport.mode': 'http' # Carefull, beeline client stop working
    oozie_site:
      'oozie.service.ProxyUserService.proxyuser.hue.hosts': '*'
      'oozie.service.ProxyUserService.proxyuser.hue.groups': '*'
    hue_ini:
      desktop:
        smtp: host: ''
        database:
          engine: 'mysql'
          password: 'hue123'
    hue_ssl_certificate: "#{__dirname}/certs/master3_cert.pem"
    hue_ssl_private_key: "#{__dirname}/certs/master3_key.pem"
    hue_ssl_client_ca: "#{__dirname}/certs/cacert.pem"
    sqoop: libs: []
    hbase_admin:
      password: 'hbase123'
    nagios:
      admin_username: 'nagiosadmin'
      admin_password: 'nagios123'
      admin_email: ''


