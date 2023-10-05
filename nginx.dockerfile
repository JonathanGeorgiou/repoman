FROM nginx

COPY config/nginx.conf /etc/nginx/conf.d/default.conf

RUN chown -R nginx:nginx /usr/share/nginx/html
RUN chmod -R 775 /usr/share/nginx/html


