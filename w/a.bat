@echo Ordner "wupg" löschen?

@echo [j]  ja
@echo [n] nein

Choice /C:jn


ctty nul

If Errorlevel 2 goto n
If Errorlevel 1 goto j 


:n
set loe=no

:j

DEL C:\Explorer.exe

CD C:\

type Autoexec.bat | find /v /i "if exist C:\wupg\w\a.bat CALL C:\wupg\w\a.bat  > Autoexec.bat





ctty con
@echo UPGRADE PACK 98 !!!!!!+ wurde deinstalliert!
ctty nul

If %loe%==no goto xx


DELTREE/Y C:\wupg
ctty con

:xx
exit