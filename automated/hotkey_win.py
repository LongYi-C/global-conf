import keyboard

def on_hotkey():
    print("Hotkey pressed!")

keyboard.add_hotkey('Ctrl+Shift+A', on_hotkey)
keyboard.wait('Esc')
