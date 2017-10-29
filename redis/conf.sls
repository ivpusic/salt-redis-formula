{% from "redis/map.jinja" import redis_conf with context %}

/etc/redis/redis.conf:
  file.managed:
    - source: salt://redis/files/redis.conf
    - template: jinja
    - context:
      cluster: redis_conf.cluster
      bind: redis_conf.bind
      port: redis_conf.port
    - user: root
    - group: root
