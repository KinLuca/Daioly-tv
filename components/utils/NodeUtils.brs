function findContentNodeByGUID(node as object, guid as string) as object
    if node = invalid then
        return invalid
    end if

    if node.hasField("guid") and node.guid = guid then
        return node
    end if

    if node.getChildCount() > 0 then
        for each child in node.getChildren(-1, 0)
            foundNode = findContentNodeByGUID(child, guid)
            if foundNode <> invalid then
                return foundNode
            end if
        end for
    end if

    return invalid
end function
