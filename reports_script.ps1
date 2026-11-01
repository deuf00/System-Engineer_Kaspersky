$today_date = (Get-Date).ToString("yyyy/MM/dd HH:mm:ss")
$txtfile = "C:\Users\Margarita\Desktop\System-Engineer_Kaspersky\Reportst\$env:computername_$today_date.txt"
Add-Content $txtfile -Value "------------- PC Information -------------"