# "Bring Me" — Game Repository Setup Guide (Rojo + VS Code + Roblox Studio)

This guide walks you through setting up the **actual development repository** for "Bring Me" from scratch, using **VS Code**, **Rojo**, **Luau**, and **Roblox Studio**.

---

## 1. Prerequisites & Tooling Installation

### 1.1 Essential Software
1. **[Roblox Studio](https://www.roblox.com/create)** — Required to run and test the game.
2. **[Visual Studio Code](https://code.visualstudio.com/)** — Code editor for Luau scripts.
3. **[Git](https://git-scm.com/)** — Version control.

### 1.2 Recommended Toolchain (via Aftman)
[Aftman](https://github.com/LPGhatguy/aftman) is the standard package manager used by professional Roblox teams to version-lock tools like Rojo, StyLua, and Selene.

Install Aftman via Windows PowerShell:
```powershell
# Install Aftman via winget or cargo
winget install --id LPGhatguy.Aftman
```

*(Alternatively, you can install Rojo standalone from [rojo.space/docs](https://rojo.space/docs/v7/getting-started/installation/)).*

### 1.3 Recommended VS Code Extensions
Install the following extensions from the VS Code Marketplace:
- **[Rojo](https://marketplace.visualstudio.com/items?itemName=evaera.vscode-rojo)** (`evaera.vscode-rojo`) — Starts and stops the Rojo server with one click.
- **[Luau Language Server](https://marketplace.visualstudio.com/items?itemName=JohnnyMorganz.luau-lsp)** (`JohnnyMorganz.luau-lsp`) — Autocomplete, strict type checking, and Roblox API definitions.
- **[StyLua](https://marketplace.visualstudio.com/items?itemName=JohnnyMorganz.stylua)** (`JohnnyMorganz.stylua`) — Automatic Luau code formatting.
- **[Selene](https://marketplace.visualstudio.com/items?itemName=Kampfkarren.selene-vscode)** (`Kampfkarren.selene-vscode`) — Linter for detecting Roblox-specific bugs and anti-patterns.

---

## 2. Initializing the Game Repository

Open PowerShell or terminal in your preferred projects folder and create the new game repository:

```powershell
# 1. Create and enter new repo folder
mkdir bring-me-game
cd bring-me-game

# 2. Initialize Git
git init
git branch -M main

# 3. Initialize Aftman toolchain (if using Aftman)
aftman init
aftman add rojo-rbx/rojo@7.4.4
aftman add JohnnyMorganz/stylua@0.20.0
aftman add Kampfkarren/selene@0.27.1
aftman install
```

---

## 3. Configuration Files

### 3.1 Project Mapping (`default.project.json`)
Create `default.project.json` at the root of the game repo. This maps your local folders into Roblox Studio DataModel containers:

```json
{
  "name": "BringMe",
  "tree": {
    "$className": "DataModel",
    "ReplicatedStorage": {
      "$className": "ReplicatedStorage",
      "Events": {
        "$path": "src/ReplicatedStorage/Events"
      },
      "Modules": {
        "$path": "src/ReplicatedStorage/Modules"
      },
      "Assets": {
        "$path": "src/ReplicatedStorage/Assets"
      }
    },
    "ServerScriptService": {
      "$className": "ServerScriptService",
      "Server": {
        "$path": "src/ServerScriptService"
      }
    },
    "StarterPlayer": {
      "$className": "StarterPlayer",
      "StarterPlayerScripts": {
        "$className": "StarterPlayerScripts",
        "Client": {
          "$path": "src/StarterPlayerScripts"
        }
      }
    },
    "StarterGui": {
      "$className": "StarterGui",
      "UI": {
        "$path": "src/StarterGui"
      }
    }
  }
}
```

### 3.2 Git Ignore (`.gitignore`)
Create `.gitignore` at the root to avoid committing cache files or heavy place files:

```gitignore
# Roblox Studio Place Builds
*.rbxl
*.rbxlx

# Aftman / Tooling
.aftman/
.wally/

# Editor files
.vscode/*
!.vscode/settings.json
!.vscode/extensions.json
.DS_Store
Thumbs.db

# Logs
*.log
```

### 3.3 Luau Strict Typing (`.luaurc`)
Create `.luaurc` at the root to enforce strict type checking across all scripts:

```json
{
  "languageMode": "strict"
}
```

---

## 4. Directory Structure Scaffold

Run the following commands in the game repo to scaffold the `src/` folders matching `default.project.json`:

```powershell
mkdir src/ReplicatedStorage/Events
mkdir src/ReplicatedStorage/Modules
mkdir src/ReplicatedStorage/Assets
mkdir src/ServerScriptService
mkdir src/StarterPlayerScripts
mkdir src/StarterGui
```

Your game folder will look like this:
```
bring-me-game/
├── default.project.json
├── .gitignore
├── .luaurc
├── aftman.toml
└── src/
    ├── ReplicatedStorage/
    │   ├── Events/          -- RemoteEvents & RemoteFunctions
    │   ├── Modules/         -- GameConfig.luau, Types.luau
    │   └── Assets/          -- TargetItems/ and Tools/
    ├── ServerScriptService/ -- Server modules & MainServer.server.luau
    ├── StarterPlayerScripts/-- Client controllers & MainClient.client.luau
    └── StarterGui/          -- UI controllers & screen logic
```

---

## 5. Connecting Rojo to Roblox Studio

### 5.1 Install the Studio Plugin
If you have Rojo installed globally:
```powershell
rojo plugin install
```
*(Or install the free **Rojo 7** plugin from the Roblox Studio Marketplace).*

### 5.2 Start the Rojo Server
In VS Code, either:
- Click the **Rojo** button in the bottom status bar, or
- Run in terminal:
  ```powershell
  rojo serve
  ```
You will see output: `Rojo server listening on 127.0.0.1:34872`.

### 5.3 Connect Studio
1. Open **Roblox Studio** and open a blank **Baseplate**.
2. Go to the **Plugins** tab in the top ribbon.
3. Click the **Rojo** icon.
4. Click **Connect** (default port `34872`).
5. **Success!** Your scripts in `src/` will now instantly sync into Roblox Studio in real time whenever you save in VS Code.

---

## 6. How to Reference the Planning Repo & Issues

When committing code in your game repository, link commits back to the issues in this planning repo:

```powershell
git commit -m "feat(round-manager): implement match lifecycle state machine (ref: BinongoIsrael/alloc8123#1)"
```

- **Spec Reference**: Consult [`docs/spec/bring-me-mvp.md`](file:///C:/Users/jayan/OneDrive/Documents/BSCS%204%20Files%20Backup/dev/alloc8-2.0/docs/spec/bring-me-mvp.md) in this repo for module interfaces.
- **Asset Reference**: Consult [`docs/assets/manifest.md`](file:///C:/Users/jayan/OneDrive/Documents/BSCS%204%20Files%20Backup/dev/alloc8-2.0/docs/assets/manifest.md) for 3D model requirements and sound briefs.
- **Issue Tracker**: Track vertical slice progress on [GitHub Issues](https://github.com/BinongoIsrael/alloc8123/issues).
