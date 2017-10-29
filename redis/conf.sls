/etc/redis/redis.conf:
  file.managed:
    - source: salt://redis/files/redis.conf
    - user: root
    - group: root
