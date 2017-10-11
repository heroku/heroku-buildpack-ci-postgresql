FROM heroku/cedar:14
MAINTAINER gregburek

RUN apt-get -q update
RUN apt-get -q -y install curl gcc g++ make wget unzip

RUN wget -q https://github.com/rlmcpherson/s3gof3r/releases/download/v0.5.0/gof3r_0.5.0_linux_amd64.tar.gz
RUN tar zxf gof3r_0.5.0_linux_amd64.tar.gz
RUN mv gof3r_0.5.0_linux_amd64/gof3r .
RUN rm -rf gof3r_0.5.0_linux_amd64*

ADD postgresql-build postgresql-build

CMD ./postgresql-build

