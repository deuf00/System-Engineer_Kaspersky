$today_date = (Get-Date).ToString("yyyy/MM/dd_HH:mm")
$computer = $env:computername
$name = "$today_date $computer"
$txtfile = "C:\Users\Margarita\Desktop\System-Engineer_Kaspersky\Reportst\$name.txt"
Add-Content $txtfile -Value "------------- PC Information -------------"