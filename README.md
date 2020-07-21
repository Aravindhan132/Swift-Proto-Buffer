# SWIFT PROTO-BUFFER

STEP TO RUN:-

SERVER SIDE

1. cd /Swift-ProtoBuffer/SERVER-BINDER
2. npm install
3. npm start

CLIENT SIDE

1.OPEN XCODE PROJECT INSIDE CLIENT


INSTALL SWIFT PROTO AND GRPC PLUGINS


Swift Code Creation Command:-

 protoc --swift_out=. my.proto
 
 protoc my.proto \ --swift_out=. \  --swiftgrpc_out=Client=true,Server=false:.
 
 
 Either you can run command directly in termial or add run script in XCode.

