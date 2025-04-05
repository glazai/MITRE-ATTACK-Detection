# simulate_task.ps1
# Simulate MITRE ATT&CK T1053.005: Scheduled Task to maintain persistence

# Define task name and action
$TaskName = "DemoPersistenceTask"
$PayloadPath = "$env:TEMP\attack.txt"
$Action = New-ScheduledTaskAction -Execute "cmd.exe" -Argument "/c echo Simulated Attack >> `"$PayloadPath`""
$Trigger = New-ScheduledTaskTrigger -AtLogOn

# Register the scheduled task
Register-ScheduledTask -TaskName $TaskName -Action $Action -Trigger $Trigger -Description "Simulates MITRE ATT&CK persistence technique T1053.005"

Write-Output "Task '$TaskName' has been created."
Write-Output "Simulated payload will execute on next logon, appending text to $PayloadPath"
