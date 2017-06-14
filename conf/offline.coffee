
module.exports = config:
  proxy: null
  yum:
    clean: true
    config: proxy: null
    repo: "#{__dirname}/offline/centos.repo"
    epel:
      enabled: true
      url: null
      repo: "#{__dirname}/offline/epel.repo"
  curl:
    check: false
    config: noproxy: ['localhost', '127.0.0.1', '.ryba']
  profile:
    'proxy.sh': "" # Created by Vagrant proxy plugin
  ntp:
    servers: ['master03.metal.ryba']
    fudge: true
  network:
    ifcfg:
      eth0:
        PEERDNS: 'yes' # Prevent dhcp-client to overwrite /etc/resolv.conf
      eth1:
        PEERDNS: 'yes' # Prevent dhcp-client to overwrite /etc/resolv.conf
  hdp:
    hue_smtp_host: ''
  ryba:
    hdp: repo: "#{__dirname}/offline/hdp.repo"
