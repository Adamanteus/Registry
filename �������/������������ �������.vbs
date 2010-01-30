Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objTextFile = objFSO.CreateTextFile("Операционная система.txt", True)
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colSettings = objWMIService.ExecQuery _
    ("Select * from Win32_OperatingSystem")
For each objOperatingSystem in colSettings
	objTextFile.WriteLine  vbtab & objOperatingSystem.Name
    objTextFile.WriteLine "Версия             : " & objOperatingSystem.Version
    objTextFile.WriteLine "Обновление         : " & objOperatingSystem.ServicePackMajorVersion & objOperatingSystem.ServicePackMinorVersion
    objTextFile.WriteLine "Каталог            : " & objOperatingSystem.WindowsDirectory
	objTextFile.WriteLine "Локализация        : " & objOperatingSystem.Locale
    objTextFile.WriteLine "Доступно памяти    : " & objOperatingSystem.FreePhysicalMemory
    objTextFile.WriteLine "Свободной памяти   : " & objOperatingSystem.FreeVirtualMemory
    objTextFile.WriteLine "В файлах подкачки  : " & objOperatingSystem.SizeStoredInPagingFiles
Next
objTextFile.Close