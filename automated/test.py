import subprocess
import win32gui
import win32con

class Window():
    def __init__(self,hwnd):
        super().__init__(model)
        self.hwnd = hwnd;
        self.title = win32gui.GetWindowText(hwnd)
        self.class_name = win32gui.GetClassName(hwnd)
    def __init__(self,title):

    def pin(self):
        # 将指定的窗口设置为前台窗口，使其获得焦点和输入。
        win32gui.SetForegroundWindow(self.hwnd)
    @staticmethod
    def GetWindow(hwnd=0,title="",class=""):
        if(hwnd != 0) return Window(hwnd)


def launch_application(application_path):
    # 检查应用程序是否已运行
    try:
        # 通过应用程序路径查找窗口句柄
        hwnd = win32gui.FindWindow(None, application_path)
        if hwnd != 0:
            # 如果找到窗口，则将其置顶
            win32gui.SetForegroundWindow(hwnd)
            print("程序正在运行")
            return

    except:
        print("程序未运行")
    
    # 如果应用程序未运行，则运行它
    try:
        subprocess.Popen(application_path)
        print("成功打开程序")
    except Exception as e:
        print(f"无法启动应用程序：{e}")
    
    # 将应用程序窗口置顶
    win32gui.SetForegroundWindow(hwnd)
    
    # 最大化应用程序窗口
    win32gui.ShowWindow(hwnd, win32con.SW_HIDE)


# 用法示例
application_path = "C:\\Program Files\\Git\\git-bash.exe"
launch_application(application_path)
