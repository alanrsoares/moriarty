require! <[ express ]>

r = express.Router!

module.exports = r

r.get '/' (req, res) ->
  res.json message: 'Hello, Moriarty!'

r.get '/key' (req, res) ->
  res.json aws-id: process.env.AWS_ID or 'not found' 
