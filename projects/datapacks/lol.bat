@echo off
setlocal enabledelayedexpansion

:: Process current directory and all subdirectories
for /d /r %%d in (*) do (
    pushd "%%d"
    :: Check if there are any files (excluding _files.txt)
    dir /b /a-d | find /v "_files.txt" | findstr /r /v "^$" >nul
    if not errorlevel 1 (
        :: Create _files.txt with list of files
        dir /b /a-d | find /v "_files.txt" > "_files.txt"
    )
    popd
)

:: Process the current directory separately (in case there are no subfolders)
dir /b /a-d | find /v "_files.txt" | findstr /r /v "^$" >nul
if not errorlevel 1 (
    dir /b /a-d | find /v "_files.txt" > "_files.txt"
)

echo File lists created successfully.