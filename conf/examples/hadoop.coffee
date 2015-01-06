
module.exports =
  # openldap_server_krb5:
  #   manager_dn: 'cn=Manager,dc=adaltas,dc=com' # Manager must have write access to "kerberos_dn"
  #   manager_password: 'test'
  #   kerberos_dn: 'ou=kerberos,dc=adaltas,dc=com'
  #   krbadmin_group:
  #     dn: 'cn=krbadmin,ou=groups,dc=adaltas,dc=com'
  #   krbadmin_user:
  #     dn: 'cn=krbadmin,ou=users,dc=adaltas,dc=com'
  #     mail: 'david@adaltas.com'
  #     userPassword: '{SSHA}uQcSsw5CySTkBXjOY/N0hcduA6yFiI0k'
  ryba:
    realm: 'HADOOP.ADALTAS.COM'
    nameservice: 'torval'
    ssh_fencing:
      private_key: "#{__dirname}/hdfs_keys/id_rsa"
      public_key: "#{__dirname}/hdfs_keys/id_rsa.pub"
    zookeeper_conf:
      'dataDir': '/var/zookeeper/data' # Default
    hdfs_site:
      'dfs.http.policy': 'HTTPS_ONLY' # Default, accepted values are "HTTP_ONLY" or "HTTPS_ONLY" or "HTTP_AND_HTTPS"
      'dfs.namenode.name.dir': ['/var/hdfs/name'] # Default
      'dfs.datanode.data.dir': ['/var/hdfs/data'] # Default
      'dfs.namenode.checkpoint.dir': ['/var/hdfs/checkpoint'] # Default, apply to non-HA mode
      'dfs.journalnode.edits.dir': ['/var/hdfs/edits'] # Default, apply to HA mode
      'dfs.datanode.failed.volumes.tolerated': '0'
    yarn:
      site:
        'yarn.nodemanager.local-dirs': ['/var/yarn/local'] # Default
        'yarn.nodemanager.log-dirs': ['/var/yarn/logs'] # Default
    pig_conf: {}
