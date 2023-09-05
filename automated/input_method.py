from win32con import WM_INPUTLANGCHANGEREQUEST
import win32gui
import win32api

# 语言代码
# https://msdn.microsoft.com/en-us/library/cc233982.aspx
LID = {0x0804: "Chinese (Simplified) (People's Republic of China)",
       0x0409: 'English (United States)'}

# 获取前景窗口句柄
hwnd = win32gui.GetForegroundWindow()

# 获取前景窗口标题
title = win32gui.GetWindowText(hwnd)
print('当前窗口：' + title)

# 获取键盘布局列表
im_list = win32api.GetKeyboardLayoutList()
im_list = list(map(hex, im_list))
print(im_list)

# 设置键盘布局为英文
result = win32api.SendMessage(
    hwnd,
    WM_INPUTLANGCHANGEREQUEST,
    0,
    0x0804)
if result == 0:
    print('设置中文键盘成功！')


import ctypes

# 定义常量
WM_IME_CONTROL = 0x0283
IMC_SETCONVERSIONMODE = 0x0002
CN_MODE = 1025
EN_MODE = 0

# 获取当前窗口句柄
hWnd = ctypes.windll.user32.GetForegroundWindow()

# 获取默认输入法句柄
DefaultIMEWnd = ctypes.windll.imm32.ImmGetDefaultIMEWnd(hWnd)

# 发送消息切换输入法模式
ctypes.windll.user32.SendMessageA(DefaultIMEWnd, WM_IME_CONTROL, IMC_SETCONVERSIONMODE, CN_MODE)

# 打印结果
print('切换为中文模式')

# 切换回英文模式
ctypes.windll.user32.SendMessageA(DefaultIMEWnd, WM_IME_CONTROL, IMC_SETCONVERSIONMODE, EN_MODE)

# 打印结果
print('切换为英文模式')

