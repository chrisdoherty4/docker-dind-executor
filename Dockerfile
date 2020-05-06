FROM docker:stable-dind

RUN apk add curl jq

RUN version=$(curl -s -L https://api.github.com/repos/docker-slim/docker-slim/releases/latest | jq -r '.tag_name') \
    && curl -s -L "https://downloads.dockerslim.com/releases/$version/dist_linux.tar.gz" | \
        tar --strip-components=1 -xz -C /usr/local/bin -f - \
    && chmod +x /usr/local/bin/docker-slim /usr/local/bin/docker-slim-sensor

COPY entrypoint.sh /usr/local/bin/docker-slim-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-slim-entrypoint.sh

ENTRYPOINT ["docker-slim-entrypoint.sh"]
CMD ["sh"]