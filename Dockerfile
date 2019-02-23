FROM centos/python-36-centos7
MAINTAINER Farhan Sajid <farhansajid7861@gmail.com>

USER root
# install pip and create virtual environment
RUN pip install virtualenv
RUN virtualenv /appenv && \
    . /appenv/bin/activate && \
    pip install pip --upgrade


# ADD entrypoint script
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
# RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

LABEL application=todobackend