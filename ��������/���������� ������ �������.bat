@ECHO OFF
if not %1. == . Set SaveDirectory = %1\
ECHO Сохранение кустов реестра %SaveDirectory%
Reg SAVE HKCR %SaveDirectory%HKCR-hive.bin
if errorlevel == 1 del %SaveDirectory%HKCR-hive.bin
Reg SAVE HKCU %SaveDirectory%HKCU-hive.bin
if errorlevel == 1 del %SaveDirectory%HKCU-hive.bin
Reg SAVE HKLM %SaveDirectory%HKLM-hive.bin
if errorlevel == 1 del %SaveDirectory%HKLM-hive.bin
Reg SAVE HKU  %SaveDirectory%HKU-hive.bin
if errorlevel == 1 del %SaveDirectory%HKU-hive.bin
