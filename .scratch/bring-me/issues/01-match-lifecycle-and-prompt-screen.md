# 01: Core Match Lifecycle and Central Prompt Screen

**What to build:** An automated round manager and central 3D Prompt Screen that coordinates the match flow. Players waiting in the central Hub observe the round progress through Intermission (15s), Countdown (5s), Scavenge (75s), and Celebration (5s). Station doors remain locked during Intermission and slide open when Countdown reaches zero. When the timer expires without a delivery, the round cleanly resets for the next match.

**Blocked by:** None (can start immediately)

**Status:** ready-for-agent

- [ ] Match state machine transitions automatically between Intermission (15s), Countdown (5s), Scavenge (75s), and Celebration (5s)
- [ ] State deltas and remaining time replicate reliably to all connected clients
- [ ] Central 3D Prompt Screen in the Hub updates in real time to display the active phase, countdown seconds, and target item prompt
- [ ] Station barrier doors lock during Intermission and open automatically when Countdown reaches zero
- [ ] Round timer expiration gracefully cleans up the round and transitions to Celebration/Intermission
