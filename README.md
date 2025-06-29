# FsWin Roblox Script

**FsWin** is a multi-purpose Roblox utility script made for exploiters who want a powerful, stylish, and user-friendly cheat GUI. Built using the [Fluent UI Library](https://github.com/dawid-scripts/Fluent), FsWin offers various features ranging from server utilities to troll options and local player enhancements.

## 💻 Features

### 🧍 Humanoid Tab
- **WalkSpeed Slider**: Adjust your movement speed (0 - 200).
- **JumpPower Slider**: Change your jump height (0 - 200).
- **Noclip Toggle**: Walk through walls and objects.
- **Godmode Toggle**: Deletes your hitbox for invincibility (experimental).
- **Invisibility Toggle**: Makes your character completely transparent.
- **Infinite Jump Toggle**: Placeholder (logic not yet implemented).

### 🛠️ Server Utility Tab
- **Surpware Chat Bypasser**: Injects a script to bypass Roblox’s chat filters.
- **Flying**: Allows your character to fly (detected by some games).
- **Click TP**: Teleports you to where you click in the game.

### 📋 Info Tab
Explains:
- What FsWin is.
- Why you should use it.
- Detection risks.
- Discord server invitation.

### ⚙️ Settings Tab
- Save/load GUI settings using Fluent's SaveManager.
- Save your themes and preferences.
- Auto-load last config.

## ⚠️ Warnings

- **This script is NOT undetectable.** Usage is at your own risk.
- Exploiting is against Roblox’s Terms of Service.
- Some features may not work on all games.
- This script requires a Lua executor (Synapse X, KRNL, Fluxus, etc.).

## 📩 Discord Integration

If your exploit supports Discord RPC, the script attempts to invite you to the FsWin Discord server directly via the client. If not, the invite link is copied to your clipboard.

---

## ✅ Requirements

- Roblox exploit with loadstring support.
- Fluent UI compatible environment.
- Executor that supports HTTP requests for full features.

## 🔗 Script Loader 

```
loadstring(game:HttpGet("https://raw.githubusercontent.com/FsWin-Project/FsWin/refs/heads/main/Important-Script/KeySystem.lua"))()
