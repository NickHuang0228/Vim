@echo off
setlocal

REM 设置Python安装路径和版本
set "PYTHON_URL=https://www.python.org/ftp/python/3.12.4/python-3.12.4-amd64.exe"
set "PYTHON_INSTALLER=python_installer.exe"
set "REQUIREMENTS_FILE=requirements.txt"

REM 检查Python是否已安装
python --version
if %errorlevel% neq 0 (
    echo Python is not installed. Downloading and installing Python...
    REM 下载Python安装程序
    powershell -Command "Invoke-WebRequest -Uri %PYTHON_URL% -OutFile %PYTHON_INSTALLER%"
    
    REM 安装Python（无用户界面，添加到PATH）
    start /wait %PYTHON_INSTALLER% /quiet InstallAllUsers=1 PrependPath=1
    
    REM 检查安装是否成功
    python --version
    if %errorlevel% neq 0 (
        echo Failed to install Python.
        pause
        exit /b %errorlevel%
    )

    REM 删除安装程序
    del %PYTHON_INSTALLER%
) else (
    echo Python is already installed.
)

REM 检查pip是否已安装
pip --version
if %errorlevel% neq 0 (
    echo pip is not installed. Installing pip...
    python -m ensurepip --upgrade
    if %errorlevel% neq 0 (
        echo Failed to install pip.
        pause
        exit /b %errorlevel%
    )
) else (
    echo pip is already installed.
)

REM 创建requirements.txt文件
echo onnxruntime > %REQUIREMENTS_FILE%
echo Pillow >> %REQUIREMENTS_FILE%
echo numpy >> %REQUIREMENTS_FILE%
echo opencv-python >> %REQUIREMENTS_FILE%
echo ddddocr >> %REQUIREMENTS_FILE%
echo watchdog >> %REQUIREMENTS_FILE%
echo hugchat >> %REQUIREMENTS_FILE%

REM 更新pip
python -m pip install --upgrade pip
if %errorlevel% neq 0 (
    echo Failed to upgrade pip.
    pause
    exit /b %errorlevel%
)

REM 安装所需的Python库
echo Installing required Python packages...
pip install -r %REQUIREMENTS_FILE%
if %errorlevel% neq 0 (
    echo Failed to install required Python packages.
    pause
    exit /b %errorlevel%
) else (
    echo Python and required packages are installed successfully.
)

REM 删除requirements.txt文件
del %REQUIREMENTS_FILE%

endlocal
pause
