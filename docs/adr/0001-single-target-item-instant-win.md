# Single Target Item Spawning and Instant Win

## Context
In multiplayer scavenger hunt games, games often spawn duplicate items to allow multiple players to complete the objective. For "Bring Me", we decided to spawn **exactly one Target Item** per round, ending the Scavenge phase immediately when that item is deposited in the Hub Deposit Zone.

## Decision
1. Exactly one Target Item spawns randomly across the map stations at round start.
2. The first player to return the Target Item to the Hub wins 1st place and immediately terminates the active countdown.
3. If the round timer expires without a delivery, the round ends in a draw with no winner bonus.

## Consequences & Trade-offs
- **High-stakes PvP**: Concentrates player conflict and hot-potato tag/steal interactions around a single high-value objective.
- **Fast, predictable match pacing**: Rounds conclude cleanly without lingering wait periods for trailing players.
- **Single winner per round**: Requires baseline participation payouts so non-winners remain motivated across repeated rounds.
