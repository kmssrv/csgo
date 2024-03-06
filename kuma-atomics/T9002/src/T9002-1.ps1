for ($i = 1; $i -le 5; $i++) {
	New-Item -ItemType Directory -Path "C:\atomic-temp\folder_$i"
	New-Item -ItemType File -Path "C:\atomic-temp\folder_$i\file.txt"
	Start-Process "cmd.exe" -ArgumentList "/c del C:\atomic-temp\folder_$i\*.txt" -NoNewWindow -Wait
}
#clean up
for ($i = 1; $i -le 5; $i++) {
	Remove-Item -Path "C:\atomic-temp\folder_$i" -Recurse -Force
}