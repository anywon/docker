FROM alpine:3.8

MAINTAINER "anywon" <diitt456@gmail.com>

WORKDIR /home/{USER}

# Make User 
RUN adduser -D {USER} && chown -R {USER}:{USER} /home/{USER} && \
mkdir /home/{USER}/supervisor && mkdir /home/{USER}

# Package Update
RUN apk update && apk upgrade && \
    apk add gcc make musl-dev supervisor python3 python3-dev && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

COPY files/pylib/requirements.txt /home/{USER}/

COPY files/conf/supervisord.conf /ahome/{USER}/supervisor
RUN rm /etc/supervisord.conf && ln -s /home/{USER}/supervisor/supervisord.conf /etc/

# python code
COPY test_web/ /home/{USER}/test_web

RUN pip3.6 install -r /home/{USER}/requirements.txt

# Remove
RUN apk del gcc make
