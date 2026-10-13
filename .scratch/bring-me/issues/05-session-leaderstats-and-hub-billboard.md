# 05: Session Leaderstats and Hub 3D Billboard

**What to build:** In-game stat tracking and persistent community leaderboards. When joining, players see their current session Coins and Total Wins displayed on the standard Roblox tab player list via `leaderstats`. In the central Hub, a prominent 3D SurfaceGui billboard queries an OrderedDataStore pipeline every 60 seconds to showcase the top 50 all-time players with their rank, avatar thumbnail, username, and win totals.

**Blocked by:** 04: Soft Currency Economy and Consumable Power-Ups

**Status:** ready-for-agent

- [ ] Standard Roblox player tab list (`leaderstats`) displays player "Coins" and "Wins"
- [ ] Round victories and coin awards immediately update the player's active session `leaderstats`
- [ ] Top 50 all-time win totals are tracked and saved in an OrderedDataStore
- [ ] Hub 3D SurfaceGui billboard refreshes periodically (60s) to show top ranked players with avatars and scores
- [ ] Leaderboard handles empty or loading data states gracefully without throwing errors
