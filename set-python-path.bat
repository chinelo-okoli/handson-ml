@echo off
set VIRTUAL_ENV=%1
if "%VIRTUAL_ENV%"=="" (
set VIRTUAL_ENV=env
)
echo "Using python dir: %PYTHON36DIR%"
cmd /c "%PYTHON36DIR%\python" -V
cmd /c "%PYTHON36DIR%\Scripts\pip3" -V
set PYTHON_EXE=%PYTHON36DIR%\python.exe
echo "New variable PYTHON_EXE is set to %PYTHON_EXE%"
echo "New variable VIRTUAL_ENV is set to %VIRTUAL_ENV%"
cmd /c "%PYTHON36DIR%\Scripts\pip3" install --upgrade virtualenv
virtualenv -p "%PYTHON_EXE%" "%VIRTUAL_ENV%"
"%VIRTUAL_ENV%\Scripts\activate"

