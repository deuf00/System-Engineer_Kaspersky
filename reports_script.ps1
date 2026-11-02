# ------------- Создание файла в формате дата_время_имя ПК -------------

$today_date = (Get-Date).ToString("yyyy-MM-dd_HH-mm-ss")
$computer = $env:computername
$name = "${today_date}_${computer}"
$txtfile = "C:\Users\Margarita\Desktop\System-Engineer_Kaspersky\Reportst\$name.txt"

#------------- Запись в файл информации о системе ( 1 и 2 пункты) -------------

Add-Content $txtfile -Value "------------- PC Information -------------"
Add-Content $txtfile -Value "PC Name -> $env:computername"

$os_version_taken = (Get-WmiObject win32_operatingsystem).caption
$os_version_raw = $os_version_taken -split " " 
$os_version = ($os_version_raw | Select-Object -Skip 1) -join " "

Add-Content $txtfile -Value "OS Version -> $os_version"