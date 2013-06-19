
# this is the entry point on the client side
# you could require() any file inside this directory
# we have decided to organize our code a bit so all client
# code goes on the lib/client/ folder
# this is not required though
# in fact you can include modules on both sides ( client and server )
# we use browserify under the covers
# an old version though
require './lib/client/main'