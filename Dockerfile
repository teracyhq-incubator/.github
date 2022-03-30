ARG BASE_IMAGE=local/base:develop

FROM ${BASE_IMAGE}

RUN echo "Hello world 2!"
