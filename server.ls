require! <[ express body-parser ]>

app     = express!
port    = process.env.PORT || 8080

router = require "./router"

allow-cors = (req, res, next) ->
  res.header \Access-Control-Allow-Origin  \*
  res.header \Access-Control-Allow-Headers \Content-Type
  res.header \Access-Control-Allow-Methods 'GET,PUT,POST,DELETE'
  next!

# configure middleware
app.use body-parser.urlencoded extended: true
app.use body-parser.json!
app.use allow-cors
app.use '/api' router

app.listen port, '127.0.0.1'

console.log "Server running on port #{port}"
console.log "Hit ctrl+c to stop it"
