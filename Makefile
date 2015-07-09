IMAGE=schoolscout/journal2gelf
GRAYLOG_SERVER=logserver
GRAYLOG_PORT=12201

build:
		docker build -t ${IMAGE} .

test: build
		journalctl -o json -f | docker run -i --rm ${IMAGE} -s ${GRAYLOG_SERVER} -p ${GRAYLOG_PORT}

push: build test
		docker push ${IMAGE}

