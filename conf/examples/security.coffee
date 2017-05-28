
module.exports =
  ryba:
    db_admin:
      engine: 'mysql'
      host: 'localhost'
      port: '3306'
      username: 'root'
      password: 'test123'
    krb5_user: password: 'test123' # User used for testing
    zkfc_password: 'hdfs123'
    hdfs:
      krb5_user: password: 'hdfs123'
    hive:
      site:
        # For MySQL database: jdbc:mysql://$mysql.full.hostname:3306/$database.name?createDatabaseIfNotExist=true
        # For Oracle database: jdbc:oracle:thin:@$dbhost:1521/$hive_dbname 
        # For PostgreSQL database: jdbc:postgresql://$dbhost:5432/$hive_dbname 
        # 'javax.jdo.option.ConnectionURL': 'jdbc:mysql://edge01.metal.hadoop:3306/hive?createDatabaseIfNotExist=true'
        # For MySQL database: com.mysql.jdbc.Driver
        # For Oracle database: oracle.jdbc.driver.OracleDriver 
        # For PostgreSQL database: org.postgresql.Driver
        'javax.jdo.option.ConnectionDriverName': 'com.mysql.jdbc.Driver'
        'javax.jdo.option.ConnectionUserName': 'hive'
        'javax.jdo.option.ConnectionPassword': 'hive123'
        # 'hive.server2.transport.mode': 'http' # Carefull, beeline client stop working
        # 'hive.metastore.uris': ''
    hue:
      ini: desktop: database:
      engine: 'mysql'
      password: 'hue123'
      ssl
        certificate: null # eg: ./certs/node1_cert.pem
        private_key: null # eg: ./certs/node_key.pem
        client_ca: null # eg: ./certs/cacert.pem
    nagios:
      admin:
        name: 'nagiosadmin' # Default
        password: 'nagios123' # Default
