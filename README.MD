### Current features:
+ Semi-automatic rewind (needs to be triggered manually)
+ GUI that you can currently change the active skill being upgraded and adjust the click delays in
+ Various combinations of simple traversal bound to hotkeys (ctrl + 1/2/3 -> Rewind | ctrl + 4 -> enter rebirth menu, spend resources and reenter campaing | ctrl + 5 -> enter campaign)

## Other controls:
+ ctrl + s -> reload
+ ctrl + q -> show/hide gui
+ ctrl + shift + 1 -> show mouse coordinate
+ ctrl + shift + 2 -> show active application

### Current issues:
+ Problem with lambda onevent function when editing delays in the gui. The ClickDelay and LoadDelay variables being updated there aren't the global variables used in SClick, but local ones that get discarded. The delays are still updated when reloading the whole script since the changes are also saved and read in the Config.ini file.
+ Skills under BS are inaccessible. Will need to add scrolling.

### Future ideas/plans:
+ OCR for various things
+ Visual counter for Rewinds until Flashback, current skill level (possibly being able to set a goal and auto switch skills and same with stats)
+ Somehow run all of that in the background (not having to focus the emulator)
+ Alert when stalling/flashback
+ Combine the three return cases (Pause, Death, Win) by detecting the state somehow
+ Auto spell (or at least enabling fimbulwinter)
+ Automate flashbacks??

### Design notes:
Currently using LDPlayer due to it not causing too many issues. The hardcoded locations aren't great, but assuming a universal 1920x1080 screen size, they shouldn't be a problem. The delay times might need tweaking, but these are working fine for me.
