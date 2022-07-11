FROM nginx:alpine
WORKDIR /opt
COPY launch.sh ./
RUN --mount=type=secret,id=BASIC_USERNAME \
  --mount=type=secret,id=BASIC_PASSWORD \
   export BASIC_USERNAME=$(cat /run/secrets/BASIC_USERNAME) && \
   export BASIC_PASSWORD=$(cat /run/secrets/BASIC_PASSWORD) && \
   apk add --no-cache gettext apache2-utils && \
   htpasswd -bc /etc/nginx/auth.htpasswd $BASIC_USERNAME $BASIC_PASSWORD && \
   chmod u+x launch.sh
COPY html/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/auth.conf
CMD ["./launch.sh"]
