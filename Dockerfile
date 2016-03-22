FROM mongo:3.0.10

RUN mkdir /backup

ENV CRON_TIME="0 0 * * *" # <Минуты> <Часы> <Дни_месяца> <Месяцы> <Дни_недели>

ADD run.sh /run.sh
VOLUME ["/backup"]
CMD ["/run.sh"]
