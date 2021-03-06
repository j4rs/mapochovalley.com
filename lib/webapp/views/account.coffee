
# Helpers

cbx = (_label, _id, _checked=false) ->
  attrs = type:'checkbox', id:_id
  if _checked 
    attrs.checked = "checked"
  p ->
    label _label + ':'
    input attrs

# HTML output

coffeescript -> require('./account').init()

div class:'container-left', ->
  div class:'logo', ->
    a href:'/', ->
      img 
        src:'/assets/mapochovalley-home.png'
        width:360
        height:140
        border:0
    p '''
      Your Mapocho Valley account is connected to your Facebook Profile.
      Most of the data comes from Facebook.
    '''

  div class:'facebook-profile', ->
    p class:'title', -> "Update your profile data:"
    a href:'#', -> img src: "http://graph.facebook.com/#{@user.uid}/picture?type=large"
    a href:"/profile/#{@user.uid}", -> div 'Go to Mapocho Valley Profile'

    form id:'edit-account-form', ->
      cbx 'Investor', 'is_investor'
      cbx 'Entrepreneur', 'is_entrepreneur'
      cbx 'Developer', 'is_developer'
      cbx 'Start-Up Chile Entrepreneur', 'is_sup'
      
      p ->
        div -> label 'Name on Badge:', 'for':'tagline'
        div -> input id:'badge_name', type:'text' , class:'required'
      
      p ->
        div -> label 'Tagline:', 'for':'tagline'
        div -> input id:'tagline', type:'text' , class:'required'

      p ->
        div -> label 'Email:', 'for':'email'
        div -> input id:'email', type:'text' , class:'required email'

      p ->
        div -> label 'Twitter ID:', 'for':'twitter_id'
        div -> input id:'twitter_id', type:'text'
      
    button id:'save-account-button', -> 'Save Changes'
        
div class:'container-right', ->
  div class:'badge', ->
    p "Your badge:"
    img id:'badge-img', src: '/badge/' + @user.uid + '.png', width: 200
