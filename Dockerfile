ARG ALPINE_VERSION=3.19.1

FROM alpine:${ALPINE_VERSION}
ARG TARGETARCH

RUN apk update
RUN apk add --no-cache bash
RUN apk add python3 py3-pip gnupg curl

ADD src/backup.sh backup.sh
ADD src/install.sh install.sh
ADD src/run.sh run.sh
ADD src/env.sh env.sh

RUN sh install.sh && rm install.sh
RUN apk del curl

CMD ["sh", "run.sh"]