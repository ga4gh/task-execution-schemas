
GOPATH := $(shell pwd)
export GOPATH
PATH := ${PATH}:$(shell pwd)/bin
export PATH

PROTO_INC= -I ./ \
	-I $(GOPATH)/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis/ \
	-I proto/

all: swagger

swagger: FORCE
	protoc $(PROTO_INC) \
		--swagger_out=logtostderr=true:swagger \
		proto/task_execution.proto

install-tools:
	echo $(GOPATH)
	go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
	go get -u github.com/golang/protobuf/protoc-gen-go

FORCE: 
