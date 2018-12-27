FROM alpine:3.8
RUN apk add --no-cache ca-certificates libstdc++ su-exec
RUN set -eux; \
    deluser xfs; \
    addgroup -g 33 fsd; \
    adduser -u 33 -s /sbin/nologin -D -Hh /var/fsd -G fsd fsd

WORKDIR /var/fsd

ADD ./src /var/fsd

RUN chown 33:33 /var/fsd -R
RUN ln -sf /dev/stdout /var/fsd/log.txt
EXPOSE 3010 3011 6809
VOLUME ["/var/fsd"]
USER fsd
ENTRYPOINT ["nohup","/var/fsd/fsd"]
CMD ["start"]
