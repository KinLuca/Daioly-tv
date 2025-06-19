function getInitialDeepLinking() as object
    return {
        mediaType: ""
        contentId: ""
    }
end function

sub setDeepLinking(args as object)
    m.global.deepLinking = {
        mediaType: args.mediaType
        contentId: args.contentId
    }
end sub
