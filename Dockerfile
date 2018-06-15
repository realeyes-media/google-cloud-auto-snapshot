FROM devth/helm
RUN apk add --update git bash && \
  rm -rf /tmp/* /var/cache/apk/*
COPY google-cloud-auto-snapshot.sh /opt/google-cloud-auto-snapshot.sh
COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod u+x /opt/google-cloud-auto-snapshot.sh /opt/entrypoint.sh
ENTRYPOINT /opt/entrypoint.sh
