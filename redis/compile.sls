{% from "redis/map.jinja" import redis_conf with context %}
{% set version = redis_conf.version %}

/root/redis-{{version}}.tar.gz:
  file.managed:
    - source: http://download.redis.io/releases/redis-{{version}}.tar.gz
    - skip_verify: True
    - unless:
      - ls /root/redis-{{version}}.tar.gz

unpack:
  cmd.wait:
    - name: tar xvf redis-{{version}}.tar.gz
    - cwd: /root
    - watch:
      - file: /root/redis-{{version}}.tar.gz

make:
  pkg.installed:
    - name: build-essential
  cmd.wait:
    - name: make
    - cwd: /root/redis-{{version}}
    - require:
      - pkg: make
    - watch:
      - cmd: unpack

copy-server:
  file.copy:
    - name: /usr/local/bin/redis-server
    - source: /root/redis-{{version}}/src/redis-server
    - force: True
    - watch:
      - cmd: make
    - unless:
      - ls /usr/local/bin/redis-server

copy-cli:
  file.copy:
    - name: /usr/local/bin/redis-cli
    - source: /root/redis-{{version}}/src/redis-cli
    - force: True
    - watch:
      - cmd: make
    - unless:
      - ls /usr/local/bin/redis-cli
