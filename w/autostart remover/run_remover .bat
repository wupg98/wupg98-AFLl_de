ctty con
@echo Einige m�gliche System blockierende "Autorun" Eintr�ge von Hintergrundprogrammen entfernen?

@echo [j]  ja (empfohlen)
@echo [n] nein,danke

Choice /C:jn
ctty nul

If Errorlevel 2 goto n12
If Errorlevel 1 goto j12 


:j12

regedit /e safefile.reg HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run

type safefile.reg | find /v /i "REGEDIT4" >> file.reg"
type file.reg | find /v /i "[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]" > file2.reg

echo REGEDIT4>delautorun.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run-] >>delautorun.reg
type file2.reg>>delautorun.reg

Del file.reg
Del file2.reg

regedit /s run_delrun.reg 
     


regedit /s delautorun.reg  

:n12
exit











