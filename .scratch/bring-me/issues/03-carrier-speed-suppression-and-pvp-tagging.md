# 03: Carrier Speed Suppression and PvP Melee Tagging

**What to build:** Melee Tag mechanic and anti-runaway balance to contest the objective. All players spawn with an innate Tag tool. Pursuers can tag the active Carrier outside the Hub to force them to drop the item to the floor with physics impulse. To keep pursuit fair, Carriers cannot activate speed boosts and are locked at default walk speed. The tagged victim receives a 1.5-second pickup debounce and 1.5-second re-tag immunity to allow chaotic scrambles. Tagging actions inside the Hub Safe Zone are strictly prohibited.

**Blocked by:** 02: Target Item Spawning and Hub Deposit Win

**Status:** ready-for-agent

- [ ] All players receive the innate Tag tool upon spawning
- [ ] Active Carrier walk speed is capped at default 16 studs/s and cannot activate Speed Boost
- [ ] Tag action is validated server-side with range checks (7.5 studs) and a 1.0-second whiff cooldown
- [ ] Tagging an active Carrier releases the overhead weld and applies a directional drop impulse to the item
- [ ] Tagged victim receives 1.5s pickup debounce and 1.5s tag immunity to prevent instant stunlocks
- [ ] Hub is configured as a Safe Zone where Tag actions are disabled to eliminate doorway camping
