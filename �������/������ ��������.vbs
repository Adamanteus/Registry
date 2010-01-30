Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objTextFile = objFSO.CreateTextFile("Список программ.txt", True)
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colSoftware = objWMIService.ExecQuery _
    ("Select * from Win32_SoftwareFeature")
For Each objFeature in colSoftware
	objTextFile.WriteLine 
	objTextFile.WriteLine vbtab & vbtab & vbtab & objFeature.Name
	objTextFile.WriteLine 
    objTextFile.WriteLine "Версия         : " & objFeature.Version
    objTextFile.WriteLine "Заголовок      : " & objFeature.Caption
    objTextFile.WriteLine "Описание       : " & objFeature.Description
    objTextFile.WriteLine "Производитель  : " & objFeature.Vendor
	objTextFile.WriteLine "Индетификатор  : " & objFeature.IdentifyingNumber
    objTextFile.WriteLine "Код установки  : " & objFeature.InstallState
    objTextFile.WriteLine "Вызовов        : " & objFeature.Accesses
    objTextFile.WriteLine "Атрибуты       : " & objFeature.Attributes
Next
objTextFile.Close