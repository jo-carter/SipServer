# syntax=docker/dockerfile:1
FROM ubuntu:20.04
WORKDIR /build
COPY . .
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow
RUN apt update && apt install build-essential cmake -y && mkdir build && cd build && cmake .. && make && cp SipServer /usr/local/bin
ENTRYPOINT ["SipServer"]
CMD ["--ip=0.0.0.0"]
EXPOSE 5060/udp
