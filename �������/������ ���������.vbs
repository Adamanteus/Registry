Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objTextFile = objFSO.CreateTextFile("Список продуктов.txt", True)
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colSoftware = objWMIService.ExecQuery _
    ("Select * from Win32_Product")
For Each objSoftware in colSoftware
	objTextFile.WriteLine 
	objTextFile.WriteLine vbtab & vbtab & vbtab & objSoftware.Name
	objTextFile.WriteLine 
    objTextFile.WriteLine "Версия         : " & objSoftware.Version
    objTextFile.WriteLine "Заголовок      : " & objSoftware.Caption
    objTextFile.WriteLine "Описание       : " & objSoftware.Description
    objTextFile.WriteLine "Индетификатор  : " & objSoftware.IdentifyingNumber
    objTextFile.WriteLine "Дата установки : " & objSoftware.InstallDate2
    objTextFile.WriteLine "Путь установки : " & objSoftware.InstallLocation
    objTextFile.WriteLine "Код установки  : " & objSoftware.InstallState
    objTextFile.WriteLine "Кеш пакета     : " & objSoftware.PackageCache
    objTextFile.WriteLine "Номер SKU      : " & objSoftware.SKUNumber
    objTextFile.WriteLine "Производитель  : " & objSoftware.Vendor
Next
objTextFile.Close