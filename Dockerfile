FROM python:3.10

WORKDIR /aiBot

COPY . /aiBot/

RUN apt-get update && apt-get install -y supervisor python3-pip python3-dev nginx

RUN chmod +x envSetup.sh && \
    ./envSetup.sh

EXPOSE 80

ENV DJANGO_SETTINGS_MODULE=django_chatbot.settings

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
