FROM armv7/armhf-ubuntu:16.04

RUN apt update -y && apt upgrade -y && apt install -y git

RUN cd /tmp && \
    git clone https://github.com/sshmanko/acestream-armv7.git . && \
    mv androidfs/system / && \
    mv androidfs/acestream.engine / && \
    mkdir -p /storage && \
    mkdir -p /system/etc && \
    cp -L /etc/resolv.conf /system/etc/resolv.conf && \
    cp -L /etc/hosts /system/etc/hosts && \
    echo "67.215.246.10 router.bittorrent.com" >> /system/etc/hosts && \
    echo "87.98.162.88 dht.transmissionbt.com" >> /system/etc/hosts && \
    chown -R root:root /system && \
    find /system -type d -exec chmod 755 {} \; && \
    find /system -type f -exec chmod 644 {} \; && \
    chmod 755 /system/bin/* /acestream.engine/python/bin/python

CMD "/system/bin/acestream.sh"
