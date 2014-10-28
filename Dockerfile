FROM ubuntu:14.04
MAINTAINER "Motiejus Jakštys" <desired.mta@gmail.com>
RUN apt-get update
RUN apt-get -y install \
    build-essential fpc postgresql postgresql-client gettext python2.7 \
    python-setuptools python-tornado python-psycopg2 python-sqlalchemy \
    python-psutil python-netifaces python-crypto python-tz python-six \
    iso-codes shared-mime-info stl-manual python-beautifulsoup \
    python-mechanize python-coverage python-mock cgroup-lite python-requests \
    python-werkzeug python-gevent python-yaml python-sphinx \
	\
	git

RUN git clone git://github.com/cms-dev/cms.git /cms -b v1.1.0
RUN cd /cms && ./setup.py build && ./setup.py install && rm -rf /cms

CMD cgroups-mount && cmsResourceService -a
