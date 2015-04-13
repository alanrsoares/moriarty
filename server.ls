require! {
  express
  lodash: _
  'body-parser'
  './router'
  './allow-cors'
}

PORT  = process.env.PORT or 3000

app   = require('express')!
http  = require('http').Server app
io    = require('socket.io') http

mapped-clients = {}

# configure middleware
app.use body-parser.urlencoded extended: true
app.use body-parser.json!
app.use allow-cors
app.use '/api' router

io.on 'connection' (socket) ->
  console.log 'a user connected', socket.id
  console.log io.sockets.sockets.map (.id)
  socket.emit 'serverMessage', "Message to socket: #{socket.id}"
  s = _.find io.sockets.sockets, id: socket.id
  s.emit 'serverMessage', "Message to socket: #{socket.id} - foo"

io.on 'handshake' (id, key) ->
  console.log { id, key }

http.listen PORT, '127.0.0.1', ->
  console.log "Server running on port #{PORT}\n" +
              "Hit control+c to stop it.\n"
