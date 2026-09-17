ShowMousePos() {
    MouseGetPos &x, &y
    MsgBox("X: " x "`nY: " y)
}

GetFocusedWindow() => WinGetTitle("A")
ShowFocusedWindow() => MsgBox(GetFocusedWindow())

SClick(point, delay := ClickDelay) {
    Click(point[1], point[2])
    Sleep(delay)
}

CustomDrag(startX, startY, targetX, targetY, steps := 10, delay := 40) {
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

    Sleep(500)
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

InEmulator() => InStr(GetFocusedWindow(), "LDPlayer")
InEditor() => InStr(GetFocusedWindow(), "Code")
InInterface() => InStr(GetFocusedWindow(), "DBG")

ToggleInterface() {
    if (Interface.IsOpen) {
        Interface.Hide()
        Interface.IsOpen := false
    }
    else {
        Interface.Show("x300 y150 w" . Interface_Width . " h" . Interface_Height)
        Interface.IsOpen := true
    }
}
