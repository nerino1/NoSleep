$signature = @'
[DllImport("user32.dll")]
public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
[DllImport("kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
'@

Add-Type -MemberDefinition $signature -Name "WinAPI" -Namespace "Interop"

$consoleHandle = [Interop.WinAPI]::GetConsoleWindow()
[void][Interop.WinAPI]::ShowWindowAsync($consoleHandle, 2) # 2 represents SW_SHOWMINIMIZED

Echo "No Sleep"
Echo " "

$WShell = New-Object -ComObject "Wscript.shell"
while ($true) {
    $WShell.SendKeys("{SCROLLLOCK}")
    Start-Sleep -Milliseconds 3000
    Echo "No Sleep... 1"
    $WShell.SendKeys("{SCROLLLOCK}")
    Start-Sleep -Seconds 350
    Echo "No Sleep... 2"
}