# 🏃‍♂️ "Bring Me" — Roblox Scavenger Hunt Party Game
> **Planning, Architecture & Requirements Hub**  
> *This repository is the central planning, system specification, and design documentation workspace for the "Bring Me" multiplayer Roblox game.*

---

## 📖 Quick Navigation

| Document | Purpose |
| :--- | :--- |
| **[Technical MVP Specification](docs/spec/bring-me-mvp.md)** | Full system architecture, client-server data flows, Luau modular script code, and monetization math. |
| **[Asset Manifest & Specs](docs/assets/manifest.md)** | Complete checklist & technical specs for 3D Models, 2D UI Sprites, Sound Effects, VFX Particles, and Animations. |
| **[Rojo + VS Code Setup Guide](docs/setup/project-setup.md)** | Step-by-step developer guide for setting up the actual game development repository using Rojo, VS Code, and Studio. |
| **[Domain Glossary](GLOSSARY.md)** | Ubiquitous language and canonical terminology (`Target Item`, `Hub`, `Deposit Zone`, `Carrier`, `Tag`, `Safe Zone`). |
| **[Architecture Decisions (ADRs)](docs/adr/)** | Accepted architectural decision records (`0001: Single Target Item Instant Win`, `0002: Carrier Speed Suppression`). |
| **[Implementation Issues](https://github.com/BinongoIsrael/alloc8123/issues)** | 6 tracer-bullet implementation tickets published directly on GitHub with native dependencies. |
| **[Interactive Logic Prototype](prototype/round-logic-simulator.html)** | Self-contained, zero-dependency HTML simulator to test match state transitions and PvP edge cases. |
| **[Roblox Studio Test Script](prototype/RobloxMVP_Prototype.server.luau)** | Throwaway script to paste directly into a blank Roblox Studio baseplate to test physical overhead welds and timers. |

---

## 🎮 Game Overview

**"Bring Me"** is a fast-paced multiplayer scavenger hunt party game inspired by the traditional parlor game. 

- **Setting:** A lively school/campus hub with themed stations (Library, Science Lab, Gymnasium).
- **Core Loop:**
  1. **Intermission (15s):** Players gather in the central Hub, view the prompt on the monitor, and purchase consumable Power-Ups.
  2. **Countdown (5s):** Central buzzer sounds, station doors slide open.
  3. **Scavenge Phase (75s):** Exactly one Target Item spawns in a station. Players deduce the station or use Item Radar to find it.
  4. **Overhead Carry & Scramble:** Grabbing the item welds it overhead with a luminous Highlight. Pursuers can tag the Carrier outside the Hub to force a physics drop!
  5. **Deposit & Win:** Stepping into the central Hub Deposit Zone immediately scores the item, ending the match and awarding coins!

---

## 🏗️ System Architecture

```
ReplicatedStorage/
├── Events/           -- Dedicated RemoteEvents & RemoteFunctions
├── Modules/          -- GameConfig.luau, Types.luau
└── Assets/           -- TargetItems/ and TagTool

ServerScriptService/
├── MainServer.server.luau
└── Modules/
    ├── RoundManager.luau       -- State machine & match timer
    ├── ItemSpawner.luau        -- Workspace item instantiator
    ├── CarrierManager.luau     -- Overhead weld, highlight, deposit zone
    ├── PvPHitHandler.luau      -- Hit validation, whiff cooldown, drop physics
    ├── EconomyManager.luau     -- Coin payouts, DataStore persistence
    └── LeaderboardManager.luau -- Player leaderstats & OrderedDataStore billboard
```

---

## 📋 Implementation Roadmap (GitHub Issues)

The game's development is broken down into 6 vertical-slice tracer bullet issues:

- [x] **[#1 Core Match Lifecycle and Central Prompt Screen](https://github.com/BinongoIsrael/alloc8123/issues/1)** — State machine and 3D Hub prompt screen.
- [x] **[#2 Target Item Spawning and Hub Deposit Win](https://github.com/BinongoIsrael/alloc8123/issues/2)** — Station spawns, overhead weld, and deposit zone win.
- [x] **[#3 Carrier Speed Suppression and PvP Melee Tagging](https://github.com/BinongoIsrael/alloc8123/issues/3)** — Tag tool, safe zone boundaries, drop physics, and debounces.
- [x] **[#4 Soft Currency Economy and Consumable Power-Ups](https://github.com/BinongoIsrael/alloc8123/issues/4)** — Match payouts, DataStore persistence, Speed Boost, and Item Radar.
- [x] **[#5 Session Leaderstats and Hub 3D Billboard](https://github.com/BinongoIsrael/alloc8123/issues/5)** — Player list `leaderstats` and Top 50 all-time `OrderedDataStore` billboard.
- [x] **[#6 Robux Monetization Integration](https://github.com/BinongoIsrael/alloc8123/issues/6)** — Developer Product coin packs and VIP Gamepass via `ProcessReceipt`.

---

## 🛠️ How to Transition to the Game Repository

To begin coding the game in your development repo:
1. Follow the **[Project Setup Guide](docs/setup/project-setup.md)** to initialize your game folder with Rojo and VS Code.
2. Reference the Luau module code in **[Technical MVP Specification](docs/spec/bring-me-mvp.md)**.
3. Link your git commits back to this repository's issues (`ref: BinongoIsrael/alloc8123#1`).
