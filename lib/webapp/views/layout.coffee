
# helpers
_metaprop = (p, c) -> (meta property:p, content:c) if c?
_s = (src) -> script src: src
_c = (href) -> link rel: 'stylesheet', href: href

# start HTML doc
doctype 5
html ->
  head ->
    meta charset: 'utf-8'
    # start Facebook Open Graph tags for "share" plugin compatibility
    _metaprop 'og:title', @og_title
    _metaprop 'og:description', @og_description
    _metaprop 'og:image', @og_image
    # end Facebook Open Graph tags for "share" plugin compatibility
    title ( if @title? then @title + ' @ ' else '' ) + @strings.title
    meta(name: 'description', content: @description) if @description?
    _c '/css/styles.css'
    _c 'http://fonts.googleapis.com/css?family=Permanent+Marker'
    _c 'http://fonts.googleapis.com/css?family=Droid+Serif:regular,bold'
    _c '/css/smoothness/jquery-ui-1.8.7.custom.css'
    _s 'http://widgets.twimg.com/j/2/widget.js'
    _s '/js-lib/jquery-1.4.4.min.js'
    _s '/js-lib/jquery.cookie.js'
    _s '/js-lib/jquery-ui-1.8.7.custom.min.js'
    _s '/js-lib/jquery.validate.min.js'
    _s '/js-lib/jquery.datalink.js'
    _s '/___minirpc.js'
    _s '/__fbx.js'
    _s '/client.js'
  body class:"index", ->
    section -> 
      div class:'nav', ->
        ul ->
          li -> 
            a href:"/", -> 
              "Home"
          if @show_edit_account_button
            li -> a href:"/account", -> "Edit Account"
          li -> 
            if @show_fb_login_button
              # text '<fb:profile-pic uid="loggedinuser" linked="false"></fb:profile-pic>'
              text '<fb:login-button id="fb-login-button"
                      autologoutlink="true"
                      registration-url="http://'+@config.domain+'/register"
                      fb-only="true"></fb:login-button>'
                      
    section ->
      div class:'container', ->
        @body
        
    section id:'dots', ->
      p "......"
      
    footer ->
      div class:'footer', ->
        div class:'footer-left', ->
          a href:"http://www.w3.org/html/logo/", ->
            img src:"http://www.w3.org/html/logo/badge/html5-badge-h-solo.png", width:"63", height:"64", alt:"HTML5 Powered", title:"HTML5 Powered"
        div class:'footer-right', ->
          p "This site is licensed under a Creative Commons Attribution 2.0 share alike license. Feel free to change, reuse modify and extend it."
          a href:'http://github.com/aldonline/mapochovalley.com', -> "Fork me at onGithub"