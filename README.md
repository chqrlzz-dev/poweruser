
### The One-Liner
This command can be pasted directly into a **PowerShell** window (run as Admin). It downloads your script to the temporary folder, executes it, and then deletes the local copy once the toolkit is closed.
```powershell
iwr -useb "[https://raw.githubusercontent.com/chqrlzz-dev/poweruser/main/Toolkit.ps1](https://raw.githubusercontent.com/chqrlzz-dev/poweruser/main/Toolkit.ps1)" -OutFile "$env:temp\Toolkit.ps1"; & "$env:temp\Toolkit.ps1"; Remove-Item "$env:temp\Toolkit.ps1"
```

# 🛠️ Power User Toolkit by @chqrlzz-dev

A high-performance, menu-driven PowerShell utility designed for Windows debloating, system optimization, and automated service deployment. Inspired by industry-standard tools but tailored for custom coded services.

## 🚀 Quick Start

To run the toolkit immediately without manual installation, right-click the **Start button**, select **Terminal (Admin)** or **PowerShell (Admin)**, and paste the following command:

```powershell
iwr -useb "https://raw.githubusercontent.com/chqrlzz-dev/poweruser/main/Toolkit.ps1" -OutFile "$env:temp\Toolkit.ps1"; & "$env:temp\Toolkit.ps1"; Remove-Item "$env:temp\Toolkit.ps1"
```

## ✨ Key Features

*   **🔒 System Security:** WiFi Password Extraction and Windows Update Diagnostics.
*   **🚀 Performance:** Registry-based debloating (Telemetry removal, Bing search disable, Animation speedup).
*   **📦 Automation:** One-click installers for Spotify/Spicetify and Autonomous Downloads Sorter.
*   **🔑 Activation:** Integrated Microsoft Activation Script (MAS) for Windows and Office.
*   **🧹 Maintenance:** Startup apps debloater and system UI cleanup.

## 🛠️ Usage
1. Run the command above.
2. The script will automatically request **Administrative Privileges**.
3. Use the numeric keys `[1-7]` to select a tool or tweak.
4. Follow the on-screen prompts for specific instructions (e.g., MAS guide).

## 🛡️ Registry Optimizations
This toolkit applies "Power User" registry modifications including:
- **Telemetry Block:** Stops Windows from sending background data to Microsoft.
- **Visual Speedup:** Reduces `MenuShowDelay` to 0 for a snappier UI feel.
- **Taskbar Cleanup:** Removes News, Interests, and People icons via `HKCU` modifications.

---
**Created with ❤️ by [@chqrlzz-dev](https://github.com/chqrlzz-dev)**
