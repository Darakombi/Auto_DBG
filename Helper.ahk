GetMouse() {
    MouseGetPos &x, &y
    MsgBox "X: " x "`nY: " y
}

GetFocusedWindow() {
    Title := WinGetTitle("A")
    MsgBox Title
}

SClick(point, delay := Unset) {
    if (!InStr(WinGetTitle("A"), "LDPlayer")) {
        return
    }

    Click(point[1], point[2])
    Sleep(delay ?? ClickDelay)
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
