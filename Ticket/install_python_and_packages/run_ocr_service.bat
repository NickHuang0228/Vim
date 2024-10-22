@echo off
setlocal

REM 设置Python脚本和目录路径
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_PATH=%SCRIPT_DIR%ocr_watcher.py"
set "CAPTCHA_DIR=%SCRIPT_DIR%Captcha"

REM 创建Captcha目录（如果不存在）
if not exist "%CAPTCHA_DIR%" (
    mkdir "%CAPTCHA_DIR%"
)

REM 运行Python脚本
python "%SCRIPT_PATH%"

endlocal
pause
