FROM mongo:3.0.10

RUN mkdir /backup

ENV CRON_TIME="0 0 * * *" # minutes hours day_of_month month day_of_week

ADD run.sh /run.sh
VOLUME ["/backup"]
CMD ["/run.sh"]
