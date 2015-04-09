require! <[
  express
  body-parser
  ./router
  ./allow-cors
]>

app   = express!
port  = process.env.PORT or 3000

# configure middleware
app.use body-parser.urlencoded extended: true
app.use body-parser.json!
app.use allow-cors
app.use '/api' router

app.listen port, '127.0.0.1'

console.log "Server running on port #{port}\n" +
            "Hit ctrl+c to stop it"
