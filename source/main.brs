' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********

' 1st function called when channel application starts.
sub Main(args as object)
  print "################"
  print "Start of Channel"
  print "################"
  ' Add deep linking support here. Input is an associative array containing
  ' parameters that the client defines. Examples include "options, contentID, etc."
  ' See guide here: https://sdkdocs.roku.com/display/sdkdoc/External+Control+Guide
  ' For example, if a user clicks on an ad for a movie that your app provides,
  ' you will have mapped that movie to a contentID and you can parse that ID
  ' out from the input parameter here.
  ' Call the service provider API to look up
  ' the content details, or right data from feed for id
  if args <> invalid
    print "Received Input -- write code here to check it!"
    if args.reason <> invalid
      if args.reason = "ad" then
        print "Channel launched from ad click"
        'do ad stuff here
      end if
    end if
    if args.contentID <> invalid
      m.contentID = args.contentID
      print "contentID is: " + args.contentID
      'launch/prep the content mapped to the contentID here
    end if
  end if
  showHeroScreen(args)
end sub

' Initializes the scene and shows the main homepage.
' Handles closing of the channel.
sub showHeroScreen(args as object)
  print "main.brs - [showHeroScreen]"
  screen = CreateObject("roSGScreen")
  m.port = CreateObject("roMessagePort")

  screen.setMessagePort(m.port)
  scene = screen.CreateScene("HeroScene")
  screen.show()

  input = createObject("roInput")
  input.setMessagePort(m.port)

  scene.callFunc("setLaunchArgs", args)

  while(true)
    msg = wait(0, m.port)
    msgType = type(msg)
    if msgType = "roSGScreenEvent"
      if msg.isScreenClosed() then return
    else if msgType = "roInputEvent" and msg.isInput() then
      args = msg.getInfo()
      scene.callFunc("setInputArgs", args)
    end if
  end while
end sub
