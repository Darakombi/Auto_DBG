FlashbackIconCoords := [564, 375, 626, 437]
FlashBackIconPath := "Resources\FlashbackIcon.png"

IsDetected(coords, refImagePath) {
    if (!FileExist(refImagePath)) {
        MsgBox("Image path" "`"" refImagePath "`" does not point to an image.")
        return
    }

    if (coords.Length != 4) {
        MsgBox("Invalid number of coordinate arguments")
    }
    
    CoordMode("Pixel", "Screen")

    result := ImageSearch(&oX, &oY, coords[1], coords[2], coords[3], coords[4], "*8 " refImagePath)
    ; if (result) {
    ;     MsgBox("Found at:`nx:" . oX . "`ny:" . oY)
    ; }
    ; else {
    ;     MsgBox("Not found")
    ; }
    return result
}

!t:: {
    ClickRebirthMenu()
    Sleep(10)
    IsDetected(FlashbackIconCoords, FlashBackIconPath)
}
