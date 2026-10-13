# 02: Target Item Spawning and Hub Deposit Win

**What to build:** Target item spawning in stations and delivery-based win condition. When the Scavenge phase begins, a single randomized Target Item spawns at a station spawn point with an interaction prompt. Picking it up attaches the item overhead above the avatar with a high-visibility luminous Highlight. Stepping into the central Hub Deposit Zone immediately scores the item, concludes the round early, and triggers the victory celebration for that player.

**Blocked by:** 01: Core Match Lifecycle and Central Prompt Screen

**Status:** ready-for-agent

- [ ] Exactly one Target Item spawns randomly across the configured map stations at the start of the Scavenge phase
- [ ] Interacting with the item prompt equips it as an Overhead Weld above the player's avatar
- [ ] Active Carrier receives a distinct luminous Highlight visible across the arena
- [ ] Stepping into the central Hub Deposit Zone automatically detects the Carrier and deposits the item
- [ ] Depositing the item immediately ends the Scavenge phase and declares the Carrier as the round winner
- [ ] Target item model cleanly despawns when deposited or when the round resets
