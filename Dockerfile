FROM golang:1.8

WORKDIR /go/src/app
RUN go get github.com/betheroot/pghoney && go build github.com/betheroot/pghoney

# we do it this way so that you can easily edit the config
# file locally (in the .sample file) and install it into the
# container. for example, change the listening port,
# listening address, and the like.
COPY pghoney.conf.sample pghoney.conf

# feel free to comment this line out if you wish to use hpfeeds
RUN sed -i 's/"enabled":true/"enabled":false/' pghoney.conf
CMD [ "pghoney", "-config", "pghoney.conf" ]
