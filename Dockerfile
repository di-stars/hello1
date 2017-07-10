FROM golang:latest 
RUN mkdir /app
COPY $JOB_NAME /app/main
WORKDIR /app 
CMD ["/app/main"]
EXPOSE 8081

