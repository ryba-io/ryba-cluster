
# Using OpenLDAP and Kerberos to secure an Hadoop Cluster

By default Hadoop runs in non-secure mode in which no actual authentication is
required. By configuring Hadoop runs in secure mode, each user and service needs
to be authenticated by Kerberos in order to use Hadoop services.

At the moment, Ryba only support a secured deployment of Hadoop. It integrates
to your already existing infrastructure or it will deployed all the required
components. Such components and there configuration are discussed below.

Support for a non-secured deployment is possible but there hasn't been any work
yet engaged in this direction.

## OpenLDAP Server

The Lightweight Directory Access Protocol, better known as LDAP, is

    module.exports =
      openldap_server:
        suffix: 'dc=ryba'
        root_dn: 'cn=Manager,dc=ryba'
        root_password: 'test'
        config_dn: 'cn=admin,cn=config'
        config_password: 'test'
        users_dn: 'ou=users,dc=ryba'
        groups_dn: 'ou=groups,dc=ryba'
        ldapdelete: []
        ldapadd: [
          # "#{__dirname}/ldap/users.ldif"
          # "#{__dirname}/ldap/groups.ldif"
        ]
        tls: true
        tls_ca_cert_file: "#{__dirname}/certs/cacert.pem"
        tls_cert_file: "#{__dirname}/certs/master3_cert.pem"
        tls_key_file: "#{__dirname}/certs/master3_key.pem"

## OpenLDAP Client

    module.exports =
      openldap_client:
        certificates: [
          "#{__dirname}/certs/master3_cert.pem"
        ]
        config: {}

## Kerberos Integration with OpenLDAP Server

    module.exports =
      openldap_server_krb5:
        manager_dn: 'cn=Manager,dc=ryba' # Manager must have write access to "kerberos_dn"
        manager_password: 'test'
        # kerberos_dn: 'ou=kerberos,dc=ryba'
        # groups_dn: 'cn=krbadmin,ou=groups,dc=ryba'
        # users_dn: 'cn=krbadmin,ou=users,dc=ryba'
        admin_user:
          mail: 'david@adaltas.com'
          userPassword: 'ryba123' #test

## Kerberos Server

    module.exports =
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

## SSSD

SSSD is a common framework to provide access to remote identity and
authentication resources. It runs as a daemon service on your Linux system. It
provides PAM and NSS modules.

Instead of configuring each module individually, SSSD provide a central place
to configure your remote resource and a set of command-based tools to update
each module.

    module.exports =
      sssd:
        force_check: false
        certificates: []
        test_user: 'ryba'
        config:
          'domain/hadoop':
            'cache_credentials' : 'True'
            'ldap_search_base' : 'ou=users,dc=adaltas,dc=com'
            'ldap_group_search_base' : 'ou=groups,dc=adaltas,dc=com'
            'id_provider' : 'ldap'
            'auth_provider' : 'ldap'
            'chpass_provider' : 'ldap'
            'ldap_uri' : 'ldaps://master3.hadoop:636'
            'ldap_tls_cacertdir' : '/etc/openldap/cacerts'
            # 'ldap_default_bind_dn' : 'cn=nssproxy,dc=adaltas,dc=com'
            'ldap_default_bind_dn' : 'cn=Manager,dc=adaltas,dc=com'
            'ldap_default_authtok' : 'test'
            'ldap_id_use_start_tls' : 'True'
          'domain/users':
            'cache_credentials' : 'True'
            'ldap_search_base' : 'ou=users,dc=adaltas,dc=com'
            'ldap_group_search_base' : 'ou=groups,dc=adaltas,dc=com'
            'id_provider' : 'ldap'
            'auth_provider' : 'ldap'
            'chpass_provider' : 'ldap'
            'ldap_uri' : 'ldaps://master3.hadoop:636'
            'ldap_tls_cacertdir' : '/etc/openldap/cacerts'
            # 'ldap_default_bind_dn' : 'cn=nssproxy,dc=adaltas,dc=com'
            'ldap_default_bind_dn' : 'cn=Manager,dc=adaltas,dc=com'
            'ldap_default_authtok' : 'test'
            'ldap_id_use_start_tls' : 'False'
          'sssd':
            'domains' : 'users,hadoop'