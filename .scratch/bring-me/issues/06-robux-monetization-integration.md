# 06: Robux Monetization Integration

**What to build:** Monetization integration using Roblox MarketplaceService for consumable Developer Products and premium Gamepasses. Players can purchase soft-currency coin packs (Pouch of 250 Coins, Chest of 1,000 Coins) and a permanent VIP Gamepass. The VIP Gamepass grants a permanent +20% coin boost on all match payouts and attaches an exclusive golden cosmetic trail to the avatar. All Developer Product purchases are processed idempotently server-side via `ProcessReceipt`.

**Blocked by:** 04: Soft Currency Economy and Consumable Power-Ups

**Status:** ready-for-agent

- [ ] Developer Product IDs and VIP Gamepass ID registered in central configuration
- [ ] In-game Shop interface presents "Buy Coins" and "VIP Pass" purchase prompt buttons
- [ ] `MarketplaceService.ProcessReceipt` securely credits purchased coin packages with DataStore idempotency
- [ ] VIP Gamepass owners receive a permanent +20% multiplier on all participation and victory payouts
- [ ] VIP Gamepass owners receive an exclusive golden particle trail attached to their avatar rig on spawn
