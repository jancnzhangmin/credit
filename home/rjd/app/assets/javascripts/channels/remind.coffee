App.remind = App.cable.subscriptions.create "RemindChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#allalert').text(parseInt(data.split(',')[0]) + parseInt(data.split(',')[1]))
    $('#toptranapp').text('+' + data.split(',')[0])
    $('#topwithdrawapp').text('+' + data.split(',')[1])
    if parseInt(data.split(',')[0]) > 0
      $('#toptranapp').show()
    else
      $('#toptranapp').hide()
    if parseInt(data.split(',')[1]) > 0
      $('#topwithdrawapp').show()
    else
      $('#topwithdrawapp').hide()
    audio = new Audio()
    audio.src = '/mp3/4082.mp3'
    audio.play()
    # Called when there's incoming data on the websocket for this channel

  speak: ->
    @perform 'speak'
