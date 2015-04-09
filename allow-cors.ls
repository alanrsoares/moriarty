allow-cors = (req, res, next) ->
  res.header 'Access-Control-Allow-Origin'  '*'
  res.header 'Access-Control-Allow-Headers' 'Content-Type'
  res.header 'Access-Control-Allow-Methods' 'GET,PUT,POST,DELETE'
  next!

module.exports = allow-cors
