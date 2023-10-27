@echo off
dcc32 DelphiCustomIterators.dpr > __compile_output.txt
if %errorlevel% neq 0 (type __compile_output.txt) else (DelphiCustomIterators.exe)
del __compile_output.txt
