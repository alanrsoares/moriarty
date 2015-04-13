require! {
  express
  'body-parser'
  './router'
  './allow-cors'
  'prelude-ls': { map, find }
}

PORT  = process.env.PORT or 3000

app   = require('express')!
http  = require('http').Server app
io    = require('socket.io') http

init!

function init
  init-middleware!
  init-listener!
  init-io!

function init-middleware
  # configure middleware
  app.use body-parser.urlencoded extended: true
  app.use body-parser.json!
  app.use allow-cors
  app.use '/api' router

function init-listener
  http.listen PORT, '127.0.0.1', ->
    console.log "Server running on port #{PORT}\n",
                "Hit control+c to stop it.\n"

function init-io
  io.on 'connection' (socket) ->
    console.log 'a user connected', socket.id
    s = get-socket-by-id socket.id
    s.emit 'serverMessage', "Message to socket: #{socket.id} - foo"

  io.on 'handshake' (id, key) ->
    console.log { id, key }

function get-socket-by-id id
  io.sockets.sockets |> find -> it.id is id
