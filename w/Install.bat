@echo off
ctty nul
CD C:\wupg
if not exist C:\wupg\Recover MD Recover
CD C:\wupg\w


ctty con
@echo (A)lles installieren
@echo (N)otwendigsten Features mit Updates
@echo (M)inimal installieren,die notwendigsten Features ohne Updates
@echo (E)xit
@echo Alle Features k�nnen wieder ge�ndert werden

Choice /C:anme
ctty nul
If Errorlevel 4 goto theend
If Errorlevel 3 goto m1
If Errorlevel 2 goto n
If Errorlevel 1 goto a 

:m1
set upd=no
goto n

:a
start/wait REGEDIT /s installa.reg 
ATTRIB  -h %WINDIR%\Web\folder.htt
ATTRIB -h %WINDIR%\Web\Folder.htt
ATTRIB -h %WINDIR%\Web\Wvleft.bmp
ATTRIB-h %WINDIR%\Web\wvleft.bmp
ATTRIB -h %WINDIR%\Web\wulogo.gif
ATTRIB -h %WINDIR%\Web\Wulogo.gif
ATTRIB -h %WINDIR%\Web\wvlogo.gif
ATTRIB -h %WINDIR%\Web\Wvlogo.gif
COPY %WINDIR%\Web\Folder.htt C:\wupg\Recover
COPY %WINDIR%\Web\Wvleft.gif C:\wupg\Recover
COPY %WINDIR%\Web\folder.htt C:\wupg\Recover
COPY %WINDIR%\Web\wvleft.gif C:\wupg\Recover
COPY %WINDIR%\Web\wulogo.gif C:\wupg\Recover
COPY %WINDIR%\Web\Wulogo.gif C:\wupg\Recover
COPY %WINDIR%\Web\wvlogo.gif C:\wupg\Recover
COPY %WINDIR%\Web\Wvlogo.gif C:\wupg\Recover

 

 

goto next


:n
start/wait REGEDIT /s installm.reg 

COPY %WINDIR%\Web\Folder.htt C:\wupg\Recover
COPY %WINDIR%\Web\Wvleft.gif C:\wupg\Recover
COPY %WINDIR%\Web\folder.htt C:\wupg\Recover
COPY %WINDIR%\Web\wvleft.gif C:\wupg\Recover
COPY %WINDIR%\Web\wulogo.gif C:\wupg\Recover
COPY %WINDIR%\Web\Wulogo.gif C:\wupg\Recover
COPY %WINDIR%\Web\wvlogo.gif C:\wupg\Recover
COPY %WINDIR%\Web\Wvlogo.gif C:\wupg\Recover




:next

ctty con
@echo Kopiere neue Symbole
ctty nul

COPY Icon_1.ico %WINDIR%
COPY Icon_7.ico %WINDIR%
COPY Icon_77.ico %WINDIR%
COPY Icon_11.ico %WINDIR%
COPY Icon_18.ico %WINDIR%

ctty con
@echo Registry Tweaks wurden importiert
ctty nul


ctty con
@echo Kopiere Sounds
ctty nul

 COPY %WINDIR%\Media\logoff.wav C:\wupg\Recover
COPY %WINDIR%\Media\logon.wav  C:\wupg\Recover
 COPY %WINDIR%\Media\Logoff.wav C:\wupg\Recover
COPY %WINDIR%\Media\Logon.wav  C:\wupg\Recover


COPY %WINDIR%\Media\Dermic~1.wav C:\wupg\Recover
COPY C:\wupg\w\logoff.wav %WINDIR%\Media
COPY C:\wupg\w\logon.wav %WINDIR%\Media
REN logon.wav Der Microsoft-Sound.wav
COPY C:\wupg\w\Dermic~1.wav %WINDIR%\Media
REN Der Microsoft-Sound.wav logon.wav 

ctty con
@echo Kopiere Extras
ctty nul

COPY  %windir%\System\systray.exe C:\wupg\Recover

 COPY %WINDIR%\Defrag.exe C:\wupg\Recover
 COPY %WINDIR%\Notepad.exe  C:\wupg\Recover
COPY notepad.exe  %WINDIR%
COPY %WINDIR%\Regedit.exe  C:\wupg\Recover
COPY regedit.exe  %windir%


 COPY %WINDIR%\System\Oeminfo.ini C:\wupg\recover
 COPY C:\wupg\w\Oeminfo.ini %WINDIR%\System
 

 
COPY Defrag.exe  %WINDIR%



 ATTRIB -h C:\Config.sys
 COPY C:\Config.sys C:\wupg\Recover
 COPY C:\wupg\w\Config.sys C:\

Rundll32 advpack.dll,LaunchINFSection SYSTW.INF



 CD C:\
COPY %WINDIR%\System.ini C:\wupg\Recover

attrib -h -r C:\Msdos.sys

COPY %windir%\SYSTEM\IOSUBSYS\Cdfs.vxd C:\wupg\Recover
COPY C:\wupg\w\cdfs.vxd %windir%\SYSTEM\IOSUBSYS


CD EIGENE~1

type desktop.ini | find "�$�" >desktop.ini

attrib -r -s -a -h desktop.ini
attrib +r +s +a +h desktop.ini

CD C:\wupg\w
ts2.5_setup.exe/VERYSILENT



ctty con
@echo Kopiere Internet Spiele und Movie Maker 1
ctty nul



CD %windir%
MD msg
MD MovieMaker
Copy C:\wupg\msg %windir%\msg
Copy C:\wupg\mm1 %windir%\MovieMaker
CD %windir%\msg
zclientm.exe /regserver
DELTREE/y C:\wupg\msg
DELTREE/y C:\wupg\mm1
MOVE C:\wupg\w\Games.lnk %windir%\Desktop
MOVE C:\wupg\w\MovieMk.exe.lnk  %windir%\Desktop

If %upd%==no goto mmm

CD C:\wupg\ups

ctty con
@echo Microsoft Updates werden jetzt installiert
ctty nul

CALL sp.bat



:mmm

CD C:\wupg\w
start /wait bugfixde.exe /Q:A/R:N
DEL bugfixde.exe



CD C:\wupg

ctty con
@echo L�sche Installations Dateien
ctty nul

DEL C:\wupg\w\installa.reg
DEL C:\wupg\w\installm.reg
DELTREE/y C:\wupg\ups
DEL C:\wupg\w\SYSTW.INF

DEL C:\wupg\w\ts2.5_setup.exe





ctty con
@echo Installation fertig,wichtige Dateien wurden 
@echo f�r die Deinstallation gesichert.
@echo Upgrade Pack 98 !!!!!!+ wurde erfolgreich installiert!
ctty nul
CALL C:\wupg\w\Res.bat

:theend
exit