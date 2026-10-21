@echo off
REM Builds PartyClient.exe (single portable file). Needs: Node.js, and (optional) JDK 17 + Gradle for the mod.
cd /d "%~dp0"
where gradle >nul 2>nul
if %errorlevel%==0 (
  echo Building Party Client mod...
  pushd client
  call gradle build || (echo Mod build failed & popd & pause & exit /b 1)
  copy /y build\libs\partyclient-*+mc*.jar ..\launcher\bundled\ >nul
  popd
) else (
  echo Gradle not found - skipping mod build. The launcher will run plain Fabric unless a jar is already in launcher\bundled.
)
cd launcher
call npm install || (pause & exit /b 1)
call npm run dist || (pause & exit /b 1)
echo.
echo Done! Your exe is: launcher\dist\PartyClient.exe
pause
