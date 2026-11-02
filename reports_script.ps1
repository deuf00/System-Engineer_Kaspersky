# ------------- Создание файла в формате дата_время_имя ПК -------------

$today_date = (Get-Date).ToString("yyyy-MM-dd_HH-mm-ss")
$computer = $env:computername
$name = "${today_date}_${computer}"
$txtfile = "C:\Users\Margarita\Desktop\System-Engineer_Kaspersky\Reportst\$name.txt"

#------------- Запись в файл информации о системе ( 1 и 2 пункты) -------------

Add-Content $txtfile -Value "------------- PC Information -------------"
Add-Content $txtfile -Value "PC Name -> $env:computername"

#На Российской версии винды записывание в файл слова на кириллице выдает такие символы: �, поэтому убрал первое слово
$os_version_taken = (Get-WmiObject win32_operatingsystem).caption
$os_version_raw = $os_version_taken -split " " 
$os_version = ($os_version_raw | Select-Object -Skip 1) -join " "
Add-Content $txtfile -Value "OS Version -> $os_version"

#при помощи WmiObject можно вывести всю информацию которая нужна по заданию без циклов и тд (кроме процентов)
#ну и через хэш таблицу (чтобы красиво было) создаем ключ-значение
Get-WmiObject -Class Win32_LogicalDisk | Select-Object `
    @{Name="ID"; Expression={$_.DeviceID}},
    @{Name="Size (Gb)"; Expression={[math]::Round($_.Size / 1GB, 2)}},
    @{Name="Free Space (Gb)"; Expression={[math]::Round($_.FreeSpace / 1GB, 2)}},
    @{Name="Free Space Percent"; Expression={
        if ($_.Size -gt 0) { 
            [math]::Round(($_.FreeSpace / $_.Size) * 100, 2) 
        } else { 0 }
    }} | Format-Table -AutoSize | Out-File -FilePath $txtfile -Encoding utf8 -Append

Get-Process | Sort-Object WorkingSet64 -Descending | Select-Object `
    -First 5 ProcessName, 
    @{Name="Memory(MB)";Expression={[math]::Round($_.WorkingSet64/1MB,2)}},
    @{Name="Private Memory(MB)";Expression={[math]::Round($_.PrivateMemorySize64/1MB,2)
    }} | Format-Table -AutoSize | Out-File -FilePath $txtfile -Encoding utf8 -Append

Get-Process | Measure-Object PrivateMemorySize64, WorkingSet64 -Sum | Select-Object `
    @{Name="Property"; Expression={$_.Property}},
    @{Name="Count"; Expression={$_.Count}},
    @{Name="Sum"; Expression={[math]::Round($_.Sum/1MB,2)
    }} | Format-Table -AutoSize | Out-File -FilePath $txtfile -Encoding utf8 -Append

