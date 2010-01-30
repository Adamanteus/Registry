@ECHO OFF
Set HK_EXPLORER=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer
Set HK_SEARCH=HKCU\Software\Microsoft\Search Assistant
Set HK_INTERNET=HKCU\Software\Microsoft\Internet Explorer
Reg DELETE "%HK_EXPLORER%\MenuOrder" /f
Reg DELETE "%HK_EXPLORER%\RunMRU" /f
Reg DELETE "%HK_EXPLORER%\RecentDocs" /f
Reg DELETE "%HK_EXPLORER%\ComDlg32\LastVisitedMRU" /f
Reg DELETE "%HK_SEARCH%\ACMru" /f
Reg DELETE "%HK_INTERNET%\TypedURLs" /f
Reg DELETE "%HK_INTERNET%\IntelliForms" /f


