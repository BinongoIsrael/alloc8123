# 04: Soft Currency Economy and Consumable Power-Ups

**What to build:** In-game soft currency reward loops and consumable power-up shop. At the end of every round, all active players receive 15 coins for participation, and the round winner receives a 50-coin bonus. Balances persist across sessions via DataStoreService. During Intermission, players can open the Shop interface (HUD or Hub Kiosk) to purchase single-use consumables: Speed Boost (24 studs/s for 5s, suppressed while Carrier) and Item Radar (directional beacon pointing to the active Target Item for 5s).

**Blocked by:** 03: Carrier Speed Suppression and PvP Melee Tagging

**Status:** ready-for-agent

- [ ] Coin balances persist reliably across player sessions using DataStoreService
- [ ] Round completion awards 15 participation coins to all players and +50 bonus coins to the winner
- [ ] Players can browse and purchase consumable power-ups during Intermission via HUD or Hub Kiosk
- [ ] Speed Boost consumable grants temporary 24 studs/s movement speed for 5 seconds
- [ ] Speed Boost is suppressed/cleared if the player becomes the active Carrier
- [ ] Item Radar consumable reveals an in-world directional waypoint/beam pointing to the Target Item for 5 seconds
