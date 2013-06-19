radioactive = require 'radioactive'

section_ = radioactive.cell init:'home'

GITHUB_URL = 'http://github.com/aldonline/radioactive'

nav = ->
  '.navbar.navbar-fixed-top .navbar-inner .container'._ ->
    'ul.nav'._ -> 
      'li a.brand'._ href: '/', 'Radioactive Example'
      nav_item 'home', 'Home'
      nav_item 'section1', 'Section 1'
      nav_item 'section2', 'Section 2'
      'li a'._ href: GITHUB_URL, 'Radioactive@Github'

nav_item = ( id, label ) ->
  'li'._ '.active': ( -> id is section_() ) , ->
    'a'._ href:'#', '!click': ( -> section_ id ) , label

radioactive.app ->
  nav()
  '.container'._ $marginTop: 100, ->
    switch section_()
      when 'home'
        '.well'._ ->
          'h1'._ 'Radioactive + Express.js Sample App'
          'h2'._ '( Use this as a base to build your own )'
          'a'._ href:GITHUB_URL, -> GITHUB_URL
      else
        'p'._ -> 'Section: ' + section_()