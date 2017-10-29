
module.exports =
  # config:
  #   proxy: null
  #   curl:
  #     check: false
  #     config: noproxy: ['localhost', '127.0.0.1', '.ryba']
  #   profile:
  #     'proxy.sh': "" # Created by Vagrant proxy plugin
  #   hdp:
  #     hue_smtp_host: ''
  services:
    'masson/core/yum':
      config: yum:
        config: proxy: null
        source: "#{__dirname}/offline/centos.repo"
        epel:
          enabled: false
          url: null
          source: "#{__dirname}/offline/epel.repo"
    'masson/core/network':
      config: network:
        ifcfg:
          eth0:
            PEERDNS: 'yes' # Prevent dhcp-client to overwrite /etc/resolv.conf
          eth1:
            PEERDNS: 'yes' # Prevent dhcp-client to overwrite /etc/resolv.conf
    'masson/core/ntp':
      config: ntp:
        fudge: true
    'masson/commons/mysql/server':
      config: mysql: server:
        repo:
          source: "#{__dirname}/offline/mysql.repo"
    'ryba/hdp':
      config: ryba: hdp:
        source: "#{__dirname}/offline/hdp-2.5.3.0.repo"
    'ryba/ambari/repo':
      config: ryba: ambari: repo:
        source: "#{__dirname}/offline/ambari-2.4.2.0.repo"
    'ryba/grafana/repo':
      constraints: nodes: ['edge01.metal.ryba']
      config: ryba: grafana: repo:
        source: "#{__dirname}/offline/grafana.repo"
