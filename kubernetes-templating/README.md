## How to Install

---
Заполните секреты: Откройте `values.yaml` и в секции `appSecrets` впишите 
base64-закодированные значения для **DB_PASSWORD** и **DB_USER**.  
Настройте **NetworkPolicy**: В `values.yaml` проверьте и при необходимости 
измените значение `networkPolicy.ingressControllerNamespace`, чтобы оно 
соответствовало неймспейсу, где работает Ingress-контроллер.  
Установка зависимостей: Перед установкой чарта выполнить команду:
```shell
helm dependency update ./myapp-chart
```

Установка чарта:
```shell
helm install my-release ./myapp-chart
```