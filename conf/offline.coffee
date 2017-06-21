
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
        clean: true
        config: proxy: null
        source: "#{__dirname}/offline/centos.repo"
        epel:
          enabled: true
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
    'ryba/hdp':
      config: ryba: hdp:
        source: "#{__dirname}/offline/hdp.repo"
