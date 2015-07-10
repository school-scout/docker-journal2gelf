## journal2gelf build image for Docker

This Docker image builds a statically compiled executable for [journal2gelf](https://github.com/systemd/journal2gelf) in a container.

Build `journal2gelf` executable:

    make

Run it:

    journalctl -o json -f | ./journal2gelf -s ${GRAYLOG_SERVER} -p ${GRAYLOG_PORT}
