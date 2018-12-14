FROM jobserv

ARG DIST_CI_VERSION=?
ENV APP_VERSION="$DIST_CI_VERSION"

ENV PYTHONPATH=/srv/dist-ci:/srv/jobserv

RUN mkdir -p /srv/dist-ci
COPY ./docker_run.sh /srv/dist-ci/docker_run.sh
COPY ./dist_ci /srv/dist-ci/dist_ci
COPY ./jobserv_dist_ci /srv/dist-ci/jobserv_dist_ci
COPY ./migrations /srv/dist-ci/migrations

RUN pip3 install Flask-Dance[sqla]==1.0.0 Flask-Login==0.4.1 pyjwt==1.6.4
