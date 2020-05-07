FROM docker:stable-dind

COPY entrypoint.sh /usr/local/bin/docker-executor-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-executor-entrypoint.sh

ENTRYPOINT ["docker-executor-entrypoint.sh"]
CMD ["sh"]
