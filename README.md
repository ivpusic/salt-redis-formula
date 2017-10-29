# salt-redis-formula

Formula to compile and start redis 4.0.0 cluster

Example `top.sls`:

```yml
base:
  '*':
    - redis
```

Example pillar:

```yml
redis:
  lookup:
    cluster:
      enabled: 'no'
    bind: '0.0.0.0'
    port: 6379
```
