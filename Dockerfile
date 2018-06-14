
ARG VERSION=3
FROM python:$VERSION as python

LABEL mantainer="Pedro Burón github.com/pedroburon"

ARG REQUIREMENTS_FILE=requirements.txt

COPY docker-entrypoint.sh /
COPY $REQUIREMENTS_FILE /
RUN pip install -r /$REQUIREMENTS_FILE
RUN chmod +x /docker-entrypoint.sh
RUN mkdir /src/

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["python"]
