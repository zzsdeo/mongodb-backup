FROM mongo:3.0.10

RUN mkdir /backup && \
    apt-get update && \
    apt-get install -y cron

# minutes hours day_of_month month day_of_week
ENV CRON_TIME="0 0 * * *"

ADD run.sh /run.sh
VOLUME ["/backup"]
CMD ["/run.sh"]
