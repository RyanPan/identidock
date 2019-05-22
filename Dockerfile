FROM python:3.7

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install --upgrade pip
RUN pip install Flask==1.0.2 uWSGI==2.0.18
WORKDIR /app
COPY app /app
COPY cmd.sh /
EXPOSE 9090 9191
#USER uwsgi

#CMD ["python", "identidock.py"]
#CMD ["uwsgi", "--http", "0.0.0.0:9090", "--wsgi-file", "/app/identidock.py", "--callable", "app", "--stats", "0.0.0.0.9191"]
CMD ["/cmd.sh"]
