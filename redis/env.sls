redis_user:
  user.present:
    - name: redis
    - gid_from_name: True

/etc/redis:
  file.directory:
    - user: root
    - group: root

/var/lib/redis:
  file.directory:
    - user: redis
    - group: redis

/var/log/redis.log:
  file.managed:
    - user: redis
    - group: redis
