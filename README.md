## journal2gelf on Docker

This Docker image just runs [journal2gelf](https://github.com/systemd/journal2gelf) in a container. Use it like this:

    journalctl -o json -f | docker run -i --rm schoolscout/journal2gelf -s ${GRAYLOG_HOST} -p ${GRAYLOG_PORT}

