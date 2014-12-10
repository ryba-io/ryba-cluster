
module.exports =
  ryba:
    zkfc_password: 'hdfs123'
    hdfs_password: 'hdfs123'
    test_password: 'test123'
    hive_site:
      # For MySQL database: jdbc:mysql://$mysql.full.hostname:3306/$database.name?createDatabaseIfNotExist=true
      # For Oracle database: jdbc:oracle:thin:@$dbhost:1521/$hive_dbname 
      # For PostgreSQL database: jdbc:postgresql://$dbhost:5432/$hive_dbname 
      # 'javax.jdo.option.ConnectionURL': 'jdbc:mysql://front1.hadoop:3306/hive?createDatabaseIfNotExist=true'
      # For MySQL database: com.mysql.jdbc.Driver
      # For Oracle database: oracle.jdbc.driver.OracleDriver 
      # For PostgreSQL database: org.postgresql.Driver
      'javax.jdo.option.ConnectionDriverName': 'com.mysql.jdbc.Driver'
      'javax.jdo.option.ConnectionUserName': 'hive'
      'javax.jdo.option.ConnectionPassword': 'hive123'
      # 'hive.server2.transport.mode': 'http' # Carefull, beeline client stop working
      # 'hive.metastore.uris': ''
    hue_ini: desktop: database:
      engine: 'mysql'
      password: 'hue123'
    hue_ssl_certificate: null # eg: ./certs/node1_cert.pem
    hue_ssl_private_key: null # eg: ./certs/node_key.pem
    hue_ssl_client_ca: null # eg: ./certs/cacert.pem
    nagios:
      admin_username: 'nagiosadmin' # Default
      admin_password: 'nagios123' # Default




