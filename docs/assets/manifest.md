# "Bring Me" (Roblox) — Asset Manifest & Technical Specifications

This document catalogs every 3D model, 2D user interface element, sound effect, visual particle, and animation required for the **"Bring Me"** multiplayer Roblox scavenger hunt game.

---

## 1. 3D Models & MeshParts

### 1.1 Map & Environment Architecture

| Asset Name | Target Roblox Location | Instance Type | Collision / Physics | Visual & Technical Specifications | Status |
| :--- | :--- | :--- | :--- | :--- | :---: |
| **Hub Central Hall** | `Workspace.Hub` | `Model` | `CanCollide = true`, `Anchored = true` | Large open circular/hexagonal courtyard with designated `SpawnLocation` pads. Clean school/campus architecture. Budget: < 3,500 tris. | 🔲 |
| **Central Prompt Screen** | `Workspace.Hub.PromptScreen` | `Model` | `CanCollide = true`, `Anchored = true` | Massive suspended curved display or pillar housing a flat face for a `SurfaceGui` (`Face = Front`, $16 \times 9$ aspect ratio). | 🔲 |
| **Deposit Zone Pad** | `Workspace.Hub.DepositZone` | `Part` | `CanCollide = false`, `Anchored = true` | Cylindrical or square neon scoring ring ($16 \times 1 \times 16$ studs). Color: Bright Green (`Color3.fromRGB(34, 197, 94)`). | 🔲 |
| **Safe Zone Perimeter** | `Workspace.Hub.SafeZone` | `Part` | `CanCollide = false`, `Anchored = true`, `Transparency = 1` | Box collision volume encompassing the entire Hub ($80 \times 30 \times 80$ studs) used by `PvPHitHandler.IsInSafeZone()` to reject attacks. | 🔲 |
| **Shop Kiosk / NPC Stall** | `Workspace.Hub.ShopKiosk` | `Model` | `CanCollide = true`, `Anchored = true` | Cart/kiosk with a vendor character holding power-up props. Houses a `ProximityPrompt` ("Browse Power-Ups"). | 🔲 |
| **Leaderboard Billboard** | `Workspace.Hub.LeaderboardBillboard` | `Model` | `CanCollide = true`, `Anchored = true` | Standing double-sided wooden/metal billboard with a smooth rectangular face for the Top 50 `SurfaceGui`. | 🔲 |
| **Station Barrier Doors (x3)** | Entrance to each Station | `Model` | Scripted `CanCollide` & `Transparency` | Double sliding metal/glass security doors that open when Countdown reaches 0. Features a green/red indicator light. | 🔲 |
| **Science Lab Station** | `Workspace.Stations.ScienceLab` | `Model` | `CanCollide = true`, `Anchored = true` | Themed classroom with lab tables, fume hoods, chalkboards, and shelf clutter. Contains `SpawnPoints` folder. | 🔲 |
| **Library Station** | `Workspace.Stations.Library` | `Model` | `CanCollide = true`, `Anchored = true` | Quiet hall with tall wooden bookshelves, study desks, reading lamps, and carpet runners. Contains `SpawnPoints` folder. | 🔲 |
| **Gymnasium Station** | `Workspace.Stations.Gymnasium` | `Model` | `CanCollide = true`, `Anchored = true` | Hardwood basketball court, bleachers, hoop rigs, and gym equipment mats. Contains `SpawnPoints` folder. | 🔲 |

---

### 1.2 Target Items (`ReplicatedStorage.Assets.TargetItems`)
*All items are stored as `Model` instances with a single `PrimaryPart` (`BasePart` or `MeshPart`).*
*Dimensions: approximately $2 \times 2 \times 2$ studs to fit overhead avatar welding cleanly.*

| Item Id | Associated Station | Model Name | PrimaryPart Size | Visual Styling | Status |
| :--- | :--- | :--- | :--- | :--- | :---: |
| `Microscope` | Science Lab | `MicroscopeModel` | $2 \times 2.5 \times 1.5$ | Polished brass/black laboratory microscope with glass ocular lens. | 🔲 |
| `ErlenmeyerFlask` | Science Lab | `FlaskModel` | $1.8 \times 2.4 \times 1.8$ | Conical glass beaker containing glowing turquoise liquid with bubble particles. | 🔲 |
| `AncientTome` | Library | `TomeModel` | $2.2 \times 1 \times 2.8$ | Thick worn leather book bound with gold filigree and an embossed golden bookmark. | 🔲 |
| `AntiqueGlobe` | Library | `GlobeModel` | $2 \times 2.6 \times 2$ | Vintage spinning world map globe on a carved mahogany stand. | 🔲 |
| `Basketball` | Gymnasium | `BasketballModel` | $2 \times 2 \times 2$ | Classic pebbled orange basketball with black rubber channel seams. | 🔲 |
| `Dumbbell` | Gymnasium | `DumbbellModel` | $1.5 \times 1.5 \times 3$ | Heavy cast-iron hex dumbbell with knurled grip handle. | 🔲 |

---

### 1.3 Tools & In-Game Gear

| Asset Name | Target Roblox Location | Instance Type | Specifications | Status |
| :--- | :--- | :--- | :--- | :---: |
| **Tag Tool** | `ReplicatedStorage.Assets.Tools.TagTool` | `Tool` | `RequiresHandle = true`. Handle model: oversized foam boxing glove or referee whistle bat. Equipped with swing sound and raycast hit detector. | 🔲 |

---

## 2. 2D User Interface & Graphic Assets

### 2.1 UI Icons & Badges (`AssetId` Decals / PNGs)

| Asset Name | Dimensions | Format | Usage Context | Description | Status |
| :--- | :---: | :---: | :--- | :--- | :---: |
| `icon_coin.png` | $256 \times 256$ | PNG (Transparent) | HUD, Shop, Leaderboards | Beveled golden coin with an embossed star symbol. | 🔲 |
| `icon_speed_boost.png` | $256 \times 256$ | PNG (Transparent) | HUD Hotbar & Shop Card | Cyan winged running shoe surrounded by motion lines. | 🔲 |
| `icon_item_radar.png` | $256 \times 256$ | PNG (Transparent) | HUD Hotbar & Shop Card | Pulsing radar dish / sonar circular wave graphic. | 🔲 |
| `icon_pouch_coins.png` | $512 \times 512$ | PNG (Transparent) | Robux Shop Modal | Canvas coin pouch overflowing with gold (250 coin pack). | 🔲 |
| `icon_chest_coins.png` | $512 \times 512$ | PNG (Transparent) | Robux Shop Modal | Wooden treasure chest bursting with glowing gold (1,000 pack). | 🔲 |
| `icon_vip_crest.png` | $256 \times 256$ | PNG (Transparent) | Gamepass Card & Chat Tag | Regal golden crown crest with bold "VIP" lettering. | 🔲 |
| `icon_door_lock.png` | $128 \times 128$ | PNG (Transparent) | Station Door Indicators | Red padlocked lock silhouette. | 🔲 |
| `icon_door_open.png` | $128 \times 128$ | PNG (Transparent) | Station Door Indicators | Green double sliding doors open silhouette. | 🔲 |

---

### 2.2 ScreenGuis & SurfaceGuis

| Container Name | Class | Target Adornee / Parent | Screen Structure & Included Components | Status |
| :--- | :--- | :--- | :--- | :---: |
| **PromptScreenGui** | `SurfaceGui` | `Workspace.Hub.PromptScreen.DisplayPart` | - Phase Header ("INTERMISSION" / "COUNTDOWN" / "SCAVENGE")<br>- Live Digital Countdown Timer<br>- Target Item Name & `ViewportFrame` rendering rotating 3D item model | 🔲 |
| **MainHUD** | `ScreenGui` | `StarterGui` | - Top Bar: Phase indicator pill, remaining time, active Coin counter<br>- Bottom-Right Hotbar: Speed Boost button (quantity counter) & Radar button (quantity counter)<br>- Center Pop-Up Banner: Match announcements | 🔲 |
| **ShopGui** | `ScreenGui` | `StarterGui` | - Modal frame with Close (X) button<br>- Tabs: "Power-Ups" (Soft Coins) and "Coin Packs & VIP" (Robux)<br>- Dynamic item cards showing price, icon, and Purchase action | 🔲 |
| **VictoryGui** | `ScreenGui` | `StarterGui` | - Centered full-screen celebratory modal<br>- 1st Place Winner Avatar Thumbnail (`GetPlayerPlaceInstanceAsync`)<br>- "+50 Coins" winner splash / "+15 Coins" participation splash | 🔲 |
| **LeaderboardGui** | `SurfaceGui` | `Workspace.Hub.LeaderboardBillboard.DisplayPart` | - Header: "🏆 ALL-TIME TOP RETRIEVERS 🏆"<br>- Scrolling list of 50 rows: `#Rank`, Avatar Headshot icon, Username, Total Wins | 🔲 |

---

## 3. Audio & Sound Effects (SoundService)

### 3.1 Background Music (BGM)

| Track Name | Playback Trigger | Sound Properties | Style & Audio Brief | Status |
| :--- | :--- | :--- | :--- | :---: |
| `BGM_Lobby` | Intermission & Celebration | `Looped = true`, `Volume = 0.4` | Upbeat, groovy campus/game-show lobby theme (chill jazz/funk). | 🔲 |
| `BGM_Scavenge` | Scavenge Phase | `Looped = true`, `Volume = 0.5` | Fast-paced, high-tension cartoon chase music (135+ BPM brass and drums). | 🔲 |

---

### 3.2 Sound Effects (SFX)

| SFX Name | Trigger Event | Audio Description | Reference Specs | Status |
| :--- | :--- | :--- | :--- | :---: |
| `SFX_CountdownTick` | Last 5s of Countdown/Round | Crisp mechanical clock tick / digital game-show countdown beep. | Duration: 0.2s | 🔲 |
| `SFX_RoundStart` | Transition to Scavenge | Loud referee whistle or game-show buzzer signalling doors open. | Duration: 1.2s | 🔲 |
| `SFX_ItemPickup` | `ProximityPrompt` triggered | Satisfying bubble "pop" or chime as item welds overhead. | Duration: 0.5s | 🔲 |
| `SFX_ItemDeposit` | Carrier touches Deposit Zone | Classic arcade "cha-ching" cash register bell. | Duration: 1.0s | 🔲 |
| `SFX_TagHit` | Tag tool strikes Carrier | Comic cartoon punch / slap sound accompanied by squeak. | Duration: 0.4s | 🔲 |
| `SFX_TagWhiff` | Tag tool misses target | Swift air whoosh / swoosh sound. | Duration: 0.3s | 🔲 |
| `SFX_ItemDrop` | Item detached & drops | Metallic/hard ceramic impact clatter against the ground. | Duration: 0.6s | 🔲 |
| `SFX_SafeZoneDeny` | Trying to tag inside Hub | Dull error buzzer / invalid click sound. | Duration: 0.3s | 🔲 |
| `SFX_SpeedBoost` | Speed Boost activated | Wind rushing / engine acceleration surge. | Duration: 1.0s | 🔲 |
| `SFX_RadarPing` | Item Radar activated | High-tech sonar pulse / sonar ping. | Duration: 0.8s | 🔲 |
| `SFX_ShopPurchase` | Power-up bought with coins | Coins jingling / dropping into a purse. | Duration: 0.7s | 🔲 |
| `SFX_VictoryFanfare` | Round won by carrier | Triumphant brass victory fanfare with stadium cheering. | Duration: 4.0s | 🔲 |
| `SFX_DrawTimeout` | Round ends without delivery | Low pitch comedic "wah-wah" trombone fail sound. | Duration: 2.5s | 🔲 |

---

## 4. Visual Effects (VFX & Particle Emitters)

| Effect Name | Roblox Instance Type | Parent Object | Description & Visual Tuning | Status |
| :--- | :--- | :--- | :--- | :---: |
| **Carrier Luminous Highlight** | `Highlight` | Carrier `Character` | `FillColor = Color3.fromRGB(255, 215, 0)`, `OutlineColor = Color3.fromRGB(255, 255, 255)`, `FillTransparency = 0.5`. Visible through walls at close range. | 🔲 |
| **Radar Directional Beacon** | `Beam` + 2 `Attachment`s | Player `HumanoidRootPart` to Target Item | Glowing cyan beam passing through walls pointing directly toward the station where the target item is located. | 🔲 |
| **Tag Hit Impact Stars** | `ParticleEmitter` | Hit impact point | Burst of 8–12 comic yellow stars and sparks radiating outward on impact. | 🔲 |
| **Speed Boost Trail** | `ParticleEmitter` | Character `LowerTorso` | Trailing horizontal white speed-lines and dust puffs while sprinting at 24 studs/s. | 🔲 |
| **VIP Golden Aura Trail** | `Trail` | Character `LeftFoot` & `RightFoot` | Luminous golden ribbon leaving soft glittering sparkle particles behind VIP players. | 🔲 |
| **Deposit Pad Pulse** | `TweenService` on Neon Part | `Workspace.Hub.DepositZone` | Ambient transparency breathing pulse ($0.2 \rightarrow 0.6$) indicating active scoring zone. | 🔲 |
| **Victory Confetti Burst** | `ParticleEmitter` (x3 emitters) | Above `DepositZone` | Confetti streamers, paper stars, and celebratory sparkles raining down on victory. | 🔲 |

---

## 5. Avatar Animations (R15 & R6)

| Animation Name | Supported Rig | Keyframe Description | Priority | Status |
| :--- | :---: | :--- | :---: | :---: |
| **Tag Melee Swing** | R15 & R6 | Quick, snappy forward jab/whack with the right arm holding the Tag Tool. | `Action` | 🔲 |
| **Overhead Carry Pose** | R15 & R6 | *Upper-body override:* Both arms raised upright over the head supporting the floating item. | `Action` | 🔲 |
| **Winner Victory Cheer** | R15 & R6 | Cheerful celebratory jump, fist-pump, and wave animation played in the celebration spotlight. | `Action` | 🔲 |
