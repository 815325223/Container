FROM alpine:3.12
LABEL maintainer="ZCHENG <815325223@qq.com>"

# Needed by scripts
ENV OPENVPN=/etc/openvpn \
    OPENVPN_NAME=openvpn-server01
ENV EASYRSA=/usr/share/easy-rsa
ENV TZ=Asia/Shanghai

# Vars Config
ADD ./vars $EASYRSA
RUN chmod +x $EASYRSA/vars

# Replace Url
RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories && \
    apk add --update openvpn iptables bash easy-rsa openvpn-auth-pam google-authenticator openvpn-auth-ldap libqrencode && \
    ln -s /usr/share/easy-rsa/easyrsa /usr/local/bin && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/* && \
    apk add tzdata && cp /usr/share/zoneinfo/${TZ} /etc/localtime && \
    echo ${TZ} > /etc/timezone && \
    $EASYRSA/easyrsa init-pki nopass && \
    $EASYRSA/easyrsa build-ca nopass && \
    $EASYRSA/easyrsa gen-req $OPENVPN_NAME nopass && \
    $EASYRSA/easyrsa sign-req server $OPENVPN_NAME && \
    $EASYRSA/easyrsa gen-dh && \
    cp $EASYRSA/pki/ca.crt $EASYRSA/pki/dh.pem /etc/openvpn && \
    cp $EASYRSA/pki/issued/$OPENVPN_NAME.crt   /etc/openvpn && \
    cp $EASYRSA/pki/private/$OPENVPN_NAME.key  /etc/openvpn

VOLUME ["/etc/openvpn"]
EXPOSE 1195/udp
CMD ["/docker-entrypoint.sh"]
