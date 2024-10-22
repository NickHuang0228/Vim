# -*- coding: utf-8 -*-
import os
import time
from hugchat import hugchat
from hugchat.login import Login

# 设置账号信息
EMAIL = "dai2532281@gmail.com"
PASSWD = "Dai0918485777"
cookie_path_dir = "./cookies/"
qa_data_dir = "./QAData"
models_file_path = os.path.join(qa_data_dir, "models.txt")
config_file_path = os.path.join(qa_data_dir, "config.txt")

# 检查并创建 cookies 目录
if not os.path.exists(cookie_path_dir):
    os.makedirs(cookie_path_dir)

# 检查 cookies 文件
cookie_file_path = os.path.join(cookie_path_dir, "cookies.json")
if not os.path.exists(cookie_file_path):
    sign = Login(EMAIL, PASSWD)
    cookies = sign.login(cookie_dir_path=cookie_path_dir, save_cookies=True)
else:
    # 从现有的 cookies 文件加载
    with open(cookie_file_path, "r", encoding="utf-8") as f:
        cookies = {"cookies": f.read()}

# 创建 ChatBot 实例
chatbot = hugchat.ChatBot(cookies=cookies.get_dict())

# 获取可用模型列表
models = chatbot.get_available_llm_models()
default_model_index = 0

# 读取配置文件中的默认模型索引
if os.path.exists(config_file_path):
    with open(config_file_path, "r", encoding="utf-8") as config_file:
        try:
            default_model_index = int(config_file.read().strip())
        except ValueError:
            default_model_index = 0

# 切换到默认模型
chatbot.switch_llm(default_model_index)
current_model = models[default_model_index]

# 保存模型列表到文件并写入当前使用模型
with open(models_file_path, "w", encoding="utf-8") as models_file:
    for idx, model in enumerate(models):
        models_file.write(f"{idx}: {model}\n")
    models_file.write(f"\n当前使用的模型: {current_model}\n")

# 监听 question.txt 并处理
while True:
    question_path = os.path.join(qa_data_dir, "question.txt")
    answer_path = os.path.join(qa_data_dir, "Answer.txt")
    
    if os.path.exists(question_path):
        with open(question_path, "r", encoding="utf-8") as file:
            question = file.read().strip()
        
        # 生成答案
        message_result = chatbot.chat(question)
        answer = message_result.wait_until_done()
        
        # 写入答案到 Answer.txt
        with open(answer_path, "w", encoding="utf-8") as file:
            file.write(answer)
        
        # 删除 question.txt
        os.remove(question_path)
    
    time.sleep(1)
