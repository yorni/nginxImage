FROM nginx:alpine
ENV BASIC_USERNAME='user' \
    BASIC_PASSWORD='passw0rd'
RUN apk add --no-cache gettext apache2-utils
COPY html/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/auth.conf
WORKDIR /opt
COPY launch.sh ./
RUN ["chmod", "u+x", "launch.sh"]
CMD ["./launch.sh"]
