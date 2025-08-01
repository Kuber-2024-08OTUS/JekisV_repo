read:
  replicas: 1
  tolerations:
  - key: "node-role"
    operator: "Equal"
    value: "infra"
    effect: "NoSchedule"
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: node-role
            operator: In
            values:
            - infra
gateway:
  tolerations:
  - key: "node-role"
    operator: "Equal"
    value: "infra"
    effect: "NoSchedule"
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: node-role
            operator: In
            values:
            - infra
backend:
  replicas: 1
  tolerations:
  - key: "node-role"
    operator: "Equal"
    value: "infra"
    effect: "NoSchedule"
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: node-role
            operator: In
            values:
            - infra
write:
  replicas: 1
  tolerations:
  - key: "node-role"
    operator: "Equal"
    value: "infra"
    effect: "NoSchedule"
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: node-role
            operator: In
            values:
            - infra
loki:
  auth_enabled: false
  commonConfig:
    replication_factor: 1
  storage:
    type: s3
    bucketNames:
      chunks: monitoring-loki-chunks111
      ruler: monitoring-loki-ruler111
      admin: monitoring-loki-admin111
    s3:
      endpoint: s3.yandexcloud.net
      accessKeyId: ${accessKeyId}
      secretAccessKey: ${secretAccessKey}
      s3ForcePathStyle: false
      insecure: false
  schemaConfig:
    configs:
    - from: 2025-07-22
      object_store: s3
      store: tsdb
      schema: v13
      index:
        prefix: index_
        period: 24h
test:
  enabled: false
selfMonitoring:
  enabled: false
lokiCanary:
  enabled: false
chunksCache:
  allocatedMemory: 200
  tolerations:
  - key: "node-role"
    operator: "Equal"
    value: "infra"
    effect: "NoSchedule"
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: node-role
            operator: In
            values:
            - infra
resultsCache:
  allocatedMemory: 200
  tolerations:
  - key: "node-role"
    operator: "Equal"
    value: "infra"
    effect: "NoSchedule"
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: node-role
            operator: In
            values:
            - infra