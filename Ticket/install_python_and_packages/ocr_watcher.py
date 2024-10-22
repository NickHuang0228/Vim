import sys
import os
import time
import ddddocr
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

# 强制使用 UTF-8 编码
sys.stdout.reconfigure(encoding='utf-8')

# 初始化 DdddOcr 实例
ocr = ddddocr.DdddOcr()

class OCRHandler(FileSystemEventHandler):
    def __init__(self, output_file):
        self.output_file = output_file

    def process(self, file_path):
        # 尝试多次访问文件以处理文件占用问题
        for _ in range(10):
            try:
                with open(file_path, 'rb') as f:
                    img_bytes = f.read()
                result = ocr.classification(img_bytes)
                
                with open(self.output_file, 'a', encoding='utf-8') as f:
                    f.write(f"{os.path.basename(file_path)}: {result}\n")
                break
            except PermissionError:
                time.sleep(0.5)  # 等待半秒后重试
            except Exception as e:
                print(f"An error occurred: {e}")
                break

    def on_created(self, event):
        if event.is_directory:
            return
        elif event.src_path.endswith('.png'):
            self.process(event.src_path)

if __name__ == "__main__":
    script_directory = os.path.dirname(os.path.abspath(__file__))  # 获取脚本所在的目录
    watch_directory = os.path.join(script_directory, 'Captcha')  # 监控目录设置为脚本目录下的 Captcha 文件夹
    output_file = os.path.join(watch_directory, 'result.txt')  # 输出结果文件路径

    # 确保监控目录存在
    if not os.path.exists(watch_directory):
        os.makedirs(watch_directory)

    event_handler = OCRHandler(output_file)
    observer = Observer()
    observer.schedule(event_handler, watch_directory, recursive=False)
    observer.start()

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()
