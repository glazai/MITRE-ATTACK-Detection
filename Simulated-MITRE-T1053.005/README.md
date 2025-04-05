# Simulating MITRE ATT&CK Technique T1053.005: Scheduled Task

## 🧠 Objective

This project demonstrates how adversaries can maintain persistence on Windows systems by abusing Scheduled Tasks — specifically mapping to **MITRE ATT&CK technique T1053.005: Scheduled Task**.

The simulation uses PowerShell to create a scheduled task that executes at logon and writes a message to a file, simulating a basic payload.

---

## 🔍 Technique Details

- **MITRE ATT&CK ID**: [T1053.005](https://attack.mitre.org/techniques/T1053/005/)
- **Tactic**: Persistence, Privilege Escalation
- **Platform**: Windows
- **Description**: Attackers can abuse scheduled tasks to execute malicious payloads at system logon or scheduled intervals.

---

## 🛠 Tools Used

- PowerShell
- Windows Task Scheduler
- Event Viewer

---

## ⚙️ Steps to Reproduce

1. Clone this repo or download `simulate_task.ps1`
2. Open PowerShell as Administrator
3. Run the script:
   ```powershell
   ./simulate_task.ps1
4. Log off and log back in to trigger the scheduled task.
5. Navigate to %TEMP% and open attack.txt — you should see:
    Simulated Attack

📑 Detection

ou can monitor the task creation and execution using Event Viewer:

Event ID X – Task registered

Event ID Y – Task started

Event ID Z – Task completed

📁 Event Viewer path: Applications and Services Logs > Microsoft > Windows > TaskScheduler > Operational

You may also inspect scheduled tasks manually using powershell command: Get-ScheduledTask | Where-Object {$_.TaskName -eq "DemoPersistenceTask"}

🧼 Cleanup
To remove the scheduled task after testing: Unregister-ScheduledTask -TaskName "DemoPersistenceTask" -Confirm:$false

⚠️ Disclaimer
This project is for educational purposes only. The script simulates a harmless task. Do not use this in production environments or to simulate real attacks without permission.

👤 Author
George Lazai
MSc Cybersecurity Graduate