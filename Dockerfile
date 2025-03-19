FROM python:3.9-alpine3.13
LABEL maintainer="Antonio"

ENV PYTHONBUFFERED=1
ARG DEV=false
EXPOSE 8000

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
RUN chown -R root:root /app && chmod -R 755 /app

RUN python -m venv /opt && \
    /opt/bin/pip install --upgrade pip && \
    /opt/bin/pip install -r /tmp/requirements.txt && \
    if [ "$DEV" = "true" ]; then \
        /opt/bin/pip install -r /tmp/requirements.dev.txt; \
    fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

ENV PATH="/opt/bin:$PATH"

USER django-user