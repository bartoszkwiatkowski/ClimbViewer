@echo off
rem Runs Climb Viewer locally at http://localhost:8765 (needed for standard OpenStreetMap tiles).
rem Only this PC can reach it (bound to 127.0.0.1). Close this window to stop the server.
set "PY=python"
if exist "%~dp0..\.venv\Scripts\python.exe" set "PY=%~dp0..\.venv\Scripts\python.exe"
start "" http://localhost:8765/
"%PY%" -m http.server 8765 --bind 127.0.0.1 --directory "%~dp0."
