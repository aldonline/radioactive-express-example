
# What is this?

This project combines the following technologies:

* [Radioactive UI framework ( technology preview version )](https://github.com/aldonline/radioactive)
* [Express.js](http://expressjs.com/)
* [Browserify](http://browserify.org/)

# What can I use it for?

As a basis to build your own [Radioactive](https://github.com/aldonline/radioactive) HTML5 Web Application.
Note that this is meant for members of the core Radioactive Development Group. This is all the documentation you'll find.

# How?

    git checkout https://github.com/aldonline/radioactive-express-example.git
    cd radioactive-express-example
    npm install -d
    npm start
    open http://localhost:3001/

The go head and edit [/lib/client/main.coffee](https://github.com/aldonline/radioactive-express-example/blob/master/lib/client/main.coffee) to get going

# Extras

Thanks to browserify can install NPM modules and use them transparently on the client side:

    npm install underscore

And then on main.coffee ( or any other module you create ):

    _ = require 'underscore'
