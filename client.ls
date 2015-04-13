socket = require('socket.io-client') 'http://localhost:3000'

socket.on 'connect' -> console.log 'connected', socket.id
socket.on 'event' (data) -> console.log 'data received:', data
socket.on 'disconnect' -> console.log 'disconnected'
socket.on 'serverMessage' (message) -> console.log 'server message:', message
