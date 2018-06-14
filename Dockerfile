
ARG VERSION=3
FROM python:$VERSION

LABEL mantainer="Pedro Burón github.com/pedroburon"

ARG REQUIREMENTFILE=requirements.txt

COPY docker-entrypoint.sh /
COPY $REQUIREMENTFILE /
RUN pip install -r /$REQUIREMENTFILE
RUN chmod +x /docker-entrypoint.sh
RUN mkdir /src/

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["python"]

