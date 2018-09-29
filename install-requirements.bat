@echo off
echo "PYTHON_EXE is set to %PYTHON_EXE%"
echo "VIRTUAL_ENV is set to %VIRTUAL_ENV%"
python -V
pip3 -V
if "%PYTHON_EXE%"=="" (
echo "Error: python path not set" 
exit
)
if "%VIRTUAL_ENV%"=="" (
echo "Error: virtual env not set" 
exit
)

REM otherwise install dependencies
pip3 wheel --wheel-dir="%VIRTUAL_ENV%\tmp\wheelhouse" -r requirements1.txt -c constraints-chok.txt > output.log
pip3 install --no-index --find-links="%VIRTUAL_ENV%\tmp\wheelhouse" -r requirements1.txt -c constraints-chok.txt >> output.log
pip3 wheel --wheel-dir="%VIRTUAL_ENV%\tmp\wheelhouse" -r requirements2.txt -c constraints-chok.txt >> output.log
pip3 install --no-index --find-links="%VIRTUAL_ENV%\tmp\wheelhouse" -r requirements2.txt -c constraints-chok.txt >> output.log

REM jupyter extensions
jupyter contrib nbextension install >> output.log
jupyter nbextension enable toc2/main >> output.log

REM start jupyter
REM jupyter notebook
echo "Installation complete - refer to output.log"
echo "exec: 'jupyter notebook' to launch jupyter"
 