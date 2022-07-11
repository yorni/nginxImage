FROM nginx:alpine
RUN --mount=type=secret,id=BASIC_USERNAME \
  --mount=type=secret,id=BASIC_PASSWORD \
   export BASIC_USERNAME=$(cat /run/secrets/BASIC_USERNAME) && \
   export BASIC_PASSWORD=$(cat /run/secrets/BASIC_PASSWORD) 
RUN apk add --no-cache gettext apache2-utils
COPY html/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/auth.conf
WORKDIR /opt
COPY launch.sh ./
RUN ["chmod", "u+x", "launch.sh"]
CMD ["./launch.sh"]
