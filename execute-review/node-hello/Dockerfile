FROM registry.access.redhat.com/rhscl/nodejs-6-rhel7

MAINTAINER username "username@example.com"

EXPOSE 3000

COPY . /opt/app-root/src

RUN source scl_source enable rh-nodejs6 && \
    npm install --registry=http://nexus-common.apps.ocp-na2.prod.nextcle.com/repository/nodejs/

CMD /bin/bash -c 'node app.js'
