Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objTextFile = objFSO.CreateTextFile("������������ �������.txt", True)
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colSettings = objWMIService.ExecQuery _
    ("Select * from Win32_OperatingSystem")
For each objOperatingSystem in colSettings
	objTextFile.WriteLine  vbtab & objOperatingSystem.Name
    objTextFile.WriteLine "������             : " & objOperatingSystem.Version
    objTextFile.WriteLine "����������         : " & objOperatingSystem.ServicePackMajorVersion & objOperatingSystem.ServicePackMinorVersion
    objTextFile.WriteLine "�������            : " & objOperatingSystem.WindowsDirectory
	objTextFile.WriteLine "�����������        : " & objOperatingSystem.Locale
    objTextFile.WriteLine "�������� ������    : " & objOperatingSystem.FreePhysicalMemory
    objTextFile.WriteLine "��������� ������   : " & objOperatingSystem.FreeVirtualMemory
    objTextFile.WriteLine "� ������ ��������  : " & objOperatingSystem.SizeStoredInPagingFiles
Next
objTextFile.Close