Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objTextFile = objFSO.CreateTextFile("������ ���������.txt", True)
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colSoftware = objWMIService.ExecQuery _
    ("Select * from Win32_Product")
For Each objSoftware in colSoftware
	objTextFile.WriteLine 
	objTextFile.WriteLine vbtab & vbtab & vbtab & objSoftware.Name
	objTextFile.WriteLine 
    objTextFile.WriteLine "������         : " & objSoftware.Version
    objTextFile.WriteLine "���������      : " & objSoftware.Caption
    objTextFile.WriteLine "��������       : " & objSoftware.Description
    objTextFile.WriteLine "�������������  : " & objSoftware.IdentifyingNumber
    objTextFile.WriteLine "���� ��������� : " & objSoftware.InstallDate2
    objTextFile.WriteLine "���� ��������� : " & objSoftware.InstallLocation
    objTextFile.WriteLine "��� ���������  : " & objSoftware.InstallState
    objTextFile.WriteLine "��� ������     : " & objSoftware.PackageCache
    objTextFile.WriteLine "����� SKU      : " & objSoftware.SKUNumber
    objTextFile.WriteLine "�������������  : " & objSoftware.Vendor
Next
objTextFile.Close