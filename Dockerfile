ARG UPSTREAM_VERSION

FROM farcasterxyz/hubble:${UPSTREAM_VERSION}

USER root   

# WORKDIR /usr/src/app
COPY /hubble/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod u+x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

