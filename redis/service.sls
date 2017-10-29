/etc/systemd/system/redis.service:
  file.managed:
    - source: salt://redis/files/redis.service
    - user: root
    - group: root

redis.service:
  pkg.purged: []
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: /etc/systemd/system/redis.service
    - failhard: True
