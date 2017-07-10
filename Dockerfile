FROM golang:latest 
RUN mkdir /app
COPY ${WORKSPACE}/${MICRO_NAME} /app/${MICRO_NAME}
WORKDIR /app 
CMD ["/app/${MICRO_NAME}"]
EXPOSE 8081
