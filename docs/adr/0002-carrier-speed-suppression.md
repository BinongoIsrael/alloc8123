# Carrier Speed Boost Suppression

## Context
In tag and scavenger mechanics like "Steal an Egg", allowing a player who holds the objective to stack movement speed buffs frequently results in an uninteractive runaway where pursuers have zero opportunity to catch or tag them before they reach the deposit line.

## Decision
1. When a player picks up the Target Item and becomes the Carrier, any active Speed Boost buff is immediately revoked or suppressed.
2. While acting as Carrier, activating the Speed Boost power-up is blocked.
3. The Carrier moves at default Humanoid WalkSpeed (16 studs/sec), while pursuing players can use Speed Boosts (e.g. 24 studs/sec) to close distance.

## Consequences & Trade-offs
- **Guaranteed catch-up window**: Pursuers who spend currency on Speed Boosts can reliably overtake a Carrier who took a suboptimal escape route.
- **Strategic routing over brute force**: The Carrier must rely on dodging, map layout, and station geometry rather than out-running rivals in straight lines.
- **Slight player constraint**: Carriers may feel slower compared to non-carriers, but this asymmetry is essential for dynamic PvP tension.
