FROM azul/zulu-openjdk-debian:8u282

RUN set -ex; apk add xauth; touch ~/.Xauthority; xauth add ${HOST}:0 . $(xxd -l 16 -p /dev/urandom); xauth merge /Xauthority/xserver.xauth; apk add --no-cache ttf-dejavu; wget https://mediaserver.thinkorswim.com/installer/InstFiles/thinkorswim_installer.sh;chmod +x thinkorswim_installer.sh; echo -e "\n\n1\n1\n\nn\n\nn\nn\n" | ./thinkorswim_installer.sh; adduser -D thinkorswim

USER thinkorswim
WORKDIR /usr/local/thinkorswim/

ENTRYPOINT /usr/local/thinkorswim/thinkorswim
