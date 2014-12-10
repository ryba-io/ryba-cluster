
module.exports =
  xasecure:
    policymgr_url: "#{__dirname}/../shared/xasecure/xasecure-policymgr-3.5.000-release.tar"
    uxugsync_url: "#{__dirname}/../shared/xasecure/xasecure-uxugsync-3.5.000-release.tar"
    hdfs_url: "#{__dirname}/../shared/xasecure/xasecure-hadoop-3.5.000-release.tar"
    hbase_url: "#{__dirname}/../shared/xasecure/xasecure-hbase-3.5.000-release.tar"
    hive_url: "#{__dirname}/../shared/xasecure/xasecure-hive-3.5.000-release.tar"
    xasecure:
      'authentication_method': "LDAP"
      'remoteLoginEnabled': "true"
      'authServiceHostName': "master3.hadoop"
      'authServicePort': "389"
      'xa_ldap_url': "\"ldap://master3.hadoop:389\""
      'xa_ldap_userDNpattern': "\"uid={0},ou=users,dc=adaltas,dc=com\""
      'xa_ldap_groupSearchBase': "\"ou=groups,dc=adaltas,dc=com\""
      'xa_ldap_groupSearchFilter': "\"(memberUid={0})\""
      'xa_ldap_groupRoleAttribute': "cn"
    uxugsync:
      'SYNC_INTERVAL': "1"
      'SYNC_SOURCE': "ldap"
      'SYNC_LDAP_URL': "ldap://master3.hadoop:389"
      'SYNC_LDAP_BIND_DN': "cn=Manager,dc=adaltas,dc=com"
      'SYNC_LDAP_BIND_PASSWORD': "test"
      'SYNC_LDAP_USER_SEARCH_BASE': "ou=users,dc=adaltas,dc=com"
      'SYNC_LDAP_USER_SEARCH_SCOPE': "base"
      'SYNC_LDAP_USER_OBJECT_CLASS': "posixAccount"
      'SYNC_LDAP_USER_SEARCH_FILTER': ""
      'SYNC_LDAP_USER_NAME_ATTRIBUTE': "uid"
      'SYNC_LDAP_USER_GROUP_NAME_ATTRIBUTE': "gidNumber"
    hdfs:
      REPOSITORY_NAME: "vagrant_hdfs"
    hive:
      REPOSITORY_NAME: "vagrant_hive"