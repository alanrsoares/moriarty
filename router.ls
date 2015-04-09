require! <[ express ]>

r = express.Router!

module.exports = r

r.get '/' (req, res) ->
  res.json { message: 'Hello, Express' }
