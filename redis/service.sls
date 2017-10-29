redis.service:
  pkg.purged: []
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: /etc/systemd/system/redis.service
    - failhard: True
