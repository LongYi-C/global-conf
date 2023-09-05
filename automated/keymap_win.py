import keyboard

def on_hotkey():
    # 按下 Ctrl+i 时执行的操作
    print("You pressed Ctrl+i")
    # 模拟按下 PgDn 键
    keyboard.press_and_release('Ctrl+0')

keyboard.add_hotkey('ctrl+i', on_hotkey)

# 持续监听键盘事件
keyboard.wait()
