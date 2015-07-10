IMAGE=schoolscout/journal2gelf:build
GRAYLOG_SERVER=logserver
GRAYLOG_PORT=12201

journal2gelf: image
	  docker run --rm -v $$PWD:/target ${IMAGE}

image:
		docker build -t ${IMAGE} .

test: journal2gelf
		journalctl -o json -f | ./journal2gelf -s ${GRAYLOG_SERVER} -p ${GRAYLOG_PORT}

push: image test
		docker push ${IMAGE}
