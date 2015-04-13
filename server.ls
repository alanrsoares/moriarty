require! <[
  body-parser
  express
  ./router
  ./allow-cors
]>

PORT  = process.env.PORT or 3000

app   = require('express')!
http  = require('http').Server app
io    = require('socket.io') http

# configure middleware
app.use body-parser.urlencoded extended: true
app.use body-parser.json!
app.use allow-cors
app.use '/api' router

http.listen PORT, '127.0.0.1', ->
  console.log "Server running on port #{PORT}\n" +
              "Hit control+c to stop it.\n"
