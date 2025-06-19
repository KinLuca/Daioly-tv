function isAppLaunchComplete() as boolean
    return m.global.appLaunchComplete
end function

sub appLaunchComplete()
    if not isAppLaunchComplete() then
        m.top.signalBeacon("AppLaunchComplete")
        m.global.appLaunchComplete = true
    end if
end sub

sub appDialogInitiate()
    if not isAppLaunchComplete() then m.top.signalBeacon("AppDialogInitiate")
end sub

sub appDialogComplete()
    if not isAppLaunchComplete() then m.top.signalBeacon("AppDialogComplete")
end sub
