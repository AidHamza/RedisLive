FROM alpine
MAINTAINER Lyndon li <snakeliwei@gmail.com>
RUN apk add --update py-pip && rm -rf /var/cache/apk/*
RUN mkdir -p /redislive
COPY . /redislive
RUN cd /redislive \
    && pip install -r requirements.txt

WORKDIR /redislive/src

EXPOSE 8888

# Configure container to run as an executable
CMD ["./redis-monitor.py --duration=120" && "./redis-live.py"]
