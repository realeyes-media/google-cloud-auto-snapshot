FROM devth/helm

ENV KNCTL_VERSION 0.1.0
RUN apk add --update git bash && \
  rm -rf /tmp/* /var/cache/apk/*

RUN wget https://github.com/cppforlife/knctl/releases/download/v${KNCTL_VERSION}/knctl-linux-amd64 && \
  mv knctl-linux-amd64 /usr/local/bin/knctl && chmod +x /usr/local/bin/knctl
COPY google-cloud-auto-snapshot.sh /opt/google-cloud-auto-snapshot.sh
COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod u+x /opt/google-cloud-auto-snapshot.sh /opt/entrypoint.sh
ENTRYPOINT /opt/entrypoint.sh
