### Current features:
+ Semi-automatic rewind (needs to be triggered manually)
+ GUI that you can currently change the active skill being upgraded and adjust the click delays in
+ Various combinations of simple traversal bound to hotkeys (ctrl + 1/2/3 -> Rewind | ctrl + 4 -> enter rebirth menu, spend resources and reenter campaing | ctrl + 5 -> enter campaign)

## Other controls (only work in emulator & editor):
+ ctrl + s -> reload
+ ctrl + q -> show/hide gui
+ alt + 1 -> show mouse coordinate
+ alt + 2 -> show active application

### Current issues:
+ Awkward bindings. Could have buttons for each action instead in the future.

### Future ideas/plans:
+ OCR tomorrow!!
+ Visual counter for Rewinds until Flashback, current skill level (possibly being able to set a goal and auto switch skills and same with stats)
+ Somehow run all of that in the background (not having to focus the emulator)
+ Alert when stalling/flashback
+ Combine the three return cases (Pause, Death, Win) by detecting the state somehow
+ Auto spell (or at least enabling fimbulwinter)
+ Automate flashbacks??

### Design notes:
Currently using LDPlayer due to it not causing too many issues. The hardcoded locations aren't great, but assuming a universal 1920x1080 screen size, they shouldn't be a problem. The delay times might need tweaking, but these are working fine for me. Avoiding the use of LDPlayer's inbuilt keymappings and macros in case I switch emulators.
