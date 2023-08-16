FROM alpine:3.18

MAINTAINER Magomedcoder <info@magomedcoder.ru>

RUN apk add asterisk asterisk-sample-config asterisk-sounds-en

RUN mv /etc/asterisk/pjsip.conf /etc/asterisk/pjsip.conf.sample \
    && mv /etc/asterisk/extensions.conf /etc/asterisk/extensions.conf.sample \
    && mv /etc/asterisk/rtp.conf /etc/asterisk/rtp.conf.sample

COPY ./conf/pjsip.conf /etc/asterisk/
COPY ./conf/extensions.conf /etc/asterisk/
COPY ./conf/rtp.conf /etc/asterisk/

#EXPOSE 5060/udp 18000-18100/udp

EXPOSE 5060/udp

CMD ["asterisk", "-cvvvvv"]
