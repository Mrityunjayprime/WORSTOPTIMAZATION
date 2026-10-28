@echo off
setlocal EnableExtensions EnableDelayedExpansion
set "ROOT=%~dp0"
set "GRADLE_VERSION=9.4.0"
where gradle >nul 2>nul
if %errorlevel%==0 (
  gradle -p "%ROOT%" %*
  exit /b !errorlevel!
)
set "CACHE=%USERPROFILE%\.gradle\worstoptimazation-bootstrap\gradle-%GRADLE_VERSION%"
if not exist "%CACHE%\bin\gradle.bat" (
  if not exist "%USERPROFILE%\.gradle\worstoptimazation-bootstrap" mkdir "%USERPROFILE%\.gradle\worstoptimazation-bootstrap"
  powershell -NoProfile -ExecutionPolicy Bypass -Command "$u='https://services.gradle.org/distributions/gradle-%GRADLE_VERSION%-bin.zip'; Invoke-WebRequest -Uri $u -OutFile '%USERPROFILE%\.gradle\worstoptimazation-bootstrap\gradle-%GRADLE_VERSION%-bin.zip'; Expand-Archive -Force '%USERPROFILE%\.gradle\worstoptimazation-bootstrap\gradle-%GRADLE_VERSION%-bin.zip' '%USERPROFILE%\.gradle\worstoptimazation-bootstrap'"
  if errorlevel 1 exit /b %errorlevel%
)
call "%CACHE%\bin\gradle.bat" -p "%ROOT%" %*
exit /b %errorlevel%
