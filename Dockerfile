FROM

WORKDIR /usr/src/app

# COPY  ./


COPY docs/config/*.yaml /root/.config/pak/
COPY . .


# CMD ["exe/pak"]
