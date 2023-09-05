
import win32gui
import win32api
import ctypes
from enum import Enum

# Win32 常量
WM_IME_CONTROL = 0x0283        # 用于指定向输入法发送消息
IMC_SETCONVERSIONMODE = 0x0002 # 用于指定消息作用，设置转换模式
class KeyLayout(Enum):
    ch = 0x0804
    en = 0x0409

class LangModel(Enum):
    ch = 1025
    en = 0

class InputMethod:
    def __init__(self):
        # 当前窗口句柄
        self.hwnd = win32gui.GetForegroundWindow()
        # 当前窗口名称
        self.title = win32gui.GetWindowText(self.hwnd)
        # 键盘布局列表
        self.im_layout_list = list(map(hex,win32api.GetKeyboardLayoutList()));
        # 获取当前输入法布局
        self.c_layout = 0
        # 获取默认输入法
        sefl.default_ime_wnd = ctypes.windll.imm32.ImmGetDefaultIMEWnd(self.hwnd)
    
    #设置为微软拼音键盘
    #
    

    def __str__(self):
        return f"Window Handle: {self.hwnd}\nWindow Title: {self.title}\nKeyboard Layout List: {self.im_layout_list}\nCurrent KeyLayout:{self.c_layout}"
        
im = InputMethod()
print(im)
