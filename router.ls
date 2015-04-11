require! {
  express
  './aws-credentials'
}

r = express.Router!

module.exports = r

r.get '/' (req, res) ->
  res.json message: 'Hello, Moriarty!'

r.get '/key' (req, res) ->
  res.json id: aws-credentials.id
