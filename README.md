# FiveM Server Manager

A simple PowerShell tool to quickly manage and launch FiveM servers from the command line.

## Features

- 🚀 Quick server selection and launching
- 📁 Browse server directories
- ⚙️ View server configurations
- 💻 Clean, interactive CLI interface

## Requirements

- Windows PowerShell 5.1 or higher
- FiveM server installation(s)

## Installation

1. Clone this repository:
```powershell
git clone https://github.com/Millz902/FiveM-Server-Manager.git
cd FiveM-Server-Manager
```

2. Run the script:
```powershell
.\Start-FiveMServer.ps1
```

## Usage

### Basic Usage
```powershell
.\Start-FiveMServer.ps1
```

### Custom Server Path
```powershell
.\Start-FiveMServer.ps1 -ServerPath "C:\Path\To\Your\Servers"
```

## Default Configuration

By default, the script looks for servers in:
```
A:\Gaming\Gta FiveM\Server List
```

You can change this by editing the `$ServerPath` parameter in the script or passing it as an argument.

## Features in Detail

### Server Selection
- Lists all available FiveM servers in your configured directory
- Clean numbered menu for easy selection
- Option to exit without launching

### Server Actions
1. **Start Server** - Launches the FiveM server executable
2. **Open Server Folder** - Opens the server directory in File Explorer
3. **View Server Config** - Opens server.cfg in Notepad for quick edits

## Example

```
==================================
   FiveM Server Manager v1.0
==================================

Available Servers:

  [1] Liberty Scotia
  [2] Los Scotia

  [0] Exit

Select a server (0-2): 1

Selected: Liberty Scotia
Path: A:\Gaming\Gta FiveM\Server List\Liberty Scotia

Options:
  [1] Start Server
  [2] Open Server Folder
  [3] View Server Config
  [0] Cancel

Select action: 1

Starting Liberty Scotia...
Server started!

Done!
```

## Contributing

Feel free to fork and submit pull requests! This is a simple utility but improvements are always welcome.

## License

MIT License - feel free to use and modify as needed.

## Author

Created for managing multiple FiveM server installations efficiently.
