Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objTextFile = objFSO.CreateTextFile("������ ��������.txt", True)
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colSoftware = objWMIService.ExecQuery _
    ("Select * from Win32_SoftwareFeature")
For Each objFeature in colSoftware
	objTextFile.WriteLine 
	objTextFile.WriteLine vbtab & vbtab & vbtab & objFeature.Name
	objTextFile.WriteLine 
    objTextFile.WriteLine "������         : " & objFeature.Version
    objTextFile.WriteLine "���������      : " & objFeature.Caption
    objTextFile.WriteLine "��������       : " & objFeature.Description
    objTextFile.WriteLine "�������������  : " & objFeature.Vendor
	objTextFile.WriteLine "�������������  : " & objFeature.IdentifyingNumber
    objTextFile.WriteLine "��� ���������  : " & objFeature.InstallState
    objTextFile.WriteLine "�������        : " & objFeature.Accesses
    objTextFile.WriteLine "��������       : " & objFeature.Attributes
Next
objTextFile.Close