ShowMousePos() {
    MouseGetPos &x, &y
    MsgBox("X: " x "`nY: " y)
}

GetFocusedWindow() {
    Loop 3 {
        try {
            return WinGetTitle("A")
        }
        catch {
            Sleep(1000)
        }
    }
    return ""
} 
ShowFocusedWindow() => MsgBox(GetFocusedWindow())

SClick(point, delay := ClickDelay) {
    Click(point[1], point[2])
    Sleep(delay)
}

CustomDrag(startX, startY, targetX, targetY, steps := 10, delay := 40, finishDelay := 500) {
    MouseMove(startX, startY, 0)
    Click("Left Down")
    Sleep(delay)

    loop steps {
        progress := A_Index / steps
        currentX := startX + (targetX - startX) * progress
        currentY := startY + (targetY - startY) * progress

        MouseMove(currentX, currentY, 0)
        Sleep(delay)
    }

    Sleep(finishDelay)
    Click("Left Up")
}

SortArray(arr, options := "CL") {
    str := ""
    for item in arr
        str .= item . "`n"

    str := Trim(str, "`n")
    sortedStr := Sort(str)

    sortedArr := []
    for item in StrSplit(str, "`n")
        if (item != "")
            sortedArr.Push(item)

    return sortedArr
}

Clamp(val, minVal, maxVal) => Max(minVal, Min(val, maxVal))

InEmulator() => InStr(GetFocusedWindow(), "Android Device")
InEditor() => InStr(GetFocusedWindow(), "Visual Studio Code")
InOverlay() => InStr(GetFocusedWindow(), "DBG")

ToggleOverlay() {
    if (Overlay.IsOpen) {
        Overlay.Hide()
        Overlay.IsOpen := false
    }
    else {
        Overlay.Show("x300 y150 w" . Overlay_Width . " h" . Overlay_Height)
        Overlay.IsOpen := true
    }
}

CoordMode("Mouse", "Screen")

snipping := false
x1 := 0
y1 := 0

#+k:: {
    global snipping

    snipping := true
    Send "#+s"
}

~LButton:: {
    global snipping, x1, y1

    if !snipping
        return

    MouseGetPos &x1, &y1
}

~LButton Up:: {
    global snipping, x1, y1

    if !snipping
        return

    MouseGetPos &x2, &y2

    snipping := false

    left   := Min(x1, x2)
    right  := Max(x1, x2)
    top    := Min(y1, y2)
    bottom := Max(y1, y2)

    width  := right - left
    height := bottom - top

    Sleep(500)
    A_Clipboard := "x1: " left ", y1: " top ", x2:" right ", y2: " bottom
    
    ; MsgBox("x1: " left "`ny1: " top "`nx2: " right "`ny2: " bottom "`n`nWidth: " width "`nHeight: " height)
}

AltTab() {
    Send("{LAlt down}")
    Send("{Tab}")
    Send("{LAlt up}")
}