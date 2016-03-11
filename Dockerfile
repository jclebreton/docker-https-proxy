FROM yajo/https-proxy
MAINTAINER Jean-Christophe Lebreton <jclebreton@gmail.com>

ADD *.cfg /usr/local/etc/haproxy/
