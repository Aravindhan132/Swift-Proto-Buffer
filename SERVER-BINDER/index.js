const grpc = require('grpc')
const notesProto = grpc.load('builder.proto')
const uuidv1 = require('uuid/v1')

const server = new grpc.Server()
const notes = [
    { id: '1', title: 'Button', content: 'TicketNumber'},
    { id: '2', title: 'Label', content: 'Status'}
]

server.addService(notesProto.BuilderService.service, {
    list: (_, callback) => {
        callback(null, notes)
    }
})

server.bind('127.0.0.1:50051',
  grpc.ServerCredentials.createInsecure())
console.log('Server running at http://127.0.0.1:50051')
server.start()
