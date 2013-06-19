express =             require 'express'
radioactive_express = require 'radioactive/express'

app = express()

radioactive_app = radioactive_express
  # the base directory
  # must be the least common ancestor of all the files
  # you wish to require() from client.coffee ( the entry point to your client app )
  base:     __dirname
  # this is the entry point
  # the webapp ( client side ) will call require('./client')
  entry:    '/client'
  # the path on which this app will appear ( mywebsite/app )
  # you could have many apps attached to different paths
  mount:    '/app'
  # optional: JS files that will be injected into <head>
  js:       [ '/js/jquery-1.9.1.min.js', '/bootstrap/js/bootstrap.js' ]
  # optional: CSS files that will be injected into <head>
  css:      [ '/bootstrap/css/bootstrap.css', '/css/app.css' ]
  # optional: will minify javascript output, turn on some caches, etc
  production: no
  # optional: will be injected into head
  favicon:  '/favicon.png'
  # optional: all functions attached to this object
  # will be automatically published on the client side
  # the only restriction is that function parameters must
  # be serializable via JSON
  # on the client just do:
  #    radioactive.bridge.say_hello 'Aldo', ( e, r ) -> console.log e, r
  bridge:
    say_hello: (name, cb) -> cb null, "Hello #{name}"

# standard express.js configuration block
app.configure ->

  # this is where we connect the radioactive app
  # to our express.js server instance
  radioactive_app.attach app
  
  # standard express.js convention
  app.use express.static __dirname + '/lib/public'

# since the app will be mounted on /app
# we want to setup an automatic redirect
app.get '/', (req, res, next) ->
  res.writeHead 302, Location: '/app'
  res.end()

# and start our express.js server
app.listen 3001, (err, res) ->
  throw err if err?
  console.log 'radioactive-sample-webapp listening on port ' + 3001