import tkinter as tk
import keyboard

leader_key="alt"

class Root(tk.Toplevel):
    def __init__(self,model):
        super().__init__(model)

        screen_width = model.winfo_screenwidth()
        screen_height = model.winfo_screenheight()

        # 设置主窗口
        self.overrideredirect(True)  # 去掉标题栏

        # 设置窗口大小和位置
        window_width = 400
        window_height = 300
        x = (screen_width - window_width) // 2
        y = (screen_height - window_height) // 2
        self.geometry(f'{window_width}x{window_height}+{x}+{y}')

        self.close_button = tk.Button(self, text="关闭", command=model.destroy)
        self.close_button.place(relx=0.5, rely=0.5, anchor=tk.CENTER)


class Model(tk.Tk):
    def __init__(self):
        super().__init__()

        self.attributes('-fullscreen', True)  # 全屏
        self.overrideredirect(True)
        self.attributes('-alpha', 0.5)
        self.configure(bg='black')
        self.attributes("-topmost", True)

        self.root = Root(self)
        
        self.root.withdraw()
        self.withdraw()
        
        self.is_leader_key_press=False
        # 绑定ALT键按下和松开事件
        keyboard.on_press_key(leader_key, self.show_window)
        keyboard.on_release_key(leader_key, self.hide_window)
    def show_window(self,event):
        if not self.is_leader_key_press:
            self.deiconify()  # 显示窗口
            self.root.attributes("-topmost", True)
            self.root.deiconify()
            self.is_leader_key_press=True

    def hide_window(self,event):
        self.withdraw()  # 隐藏窗口
        self.root.withdraw()
        self.is_leader_key_press=False


# 创建主窗口对象
model = Model()

# 运行主窗口的消息循环
model.mainloop()
