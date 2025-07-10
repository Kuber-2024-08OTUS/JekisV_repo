FROM nginx:1.25-alpine

# Устанавливаем supervisor для управления несколькими процессами
# и curl для отладки
RUN apk add --no-cache supervisor curl

# Устанавливаем nginx-prometheus-exporter
ENV EXPORTER_VERSION=1.2.0
RUN wget https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v${EXPORTER_VERSION}/nginx-prometheus-exporter-${EXPORTER_VERSION}-linux-amd64.tar.gz \
    && tar -vxf nginx-prometheus-exporter-${EXPORTER_VERSION}-linux-amd64.tar.gz \
    && mv nginx-prometheus-exporter /usr/bin/ \
    && rm nginx-prometheus-exporter-${EXPORTER_VERSION}-linux-amd64.tar.gz

# Копируем наши файлы конфигурации
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Открываем порты: 8080 для веб-трафика и 9113 для метрик
EXPOSE 8080
EXPOSE 9113

# Запускаем supervisord, который запустит Nginx и экспортер
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]