# Party Client

Custom Minecraft (Fabric) launcher + client.

```
party-client/
  launcher/   Electron launcher (Microsoft login, Fabric versions, modpacks, settings)
  client/     Fabric mod: Party title screen, Mods menu, client mods, death animation
  build-client.sh
```

## Quick: make a single PartyClient.exe
Windows: double-click `build-exe.bat` (needs Node.js; add JDK 17 + Gradle to include the mod). Output: `launcher/dist/PartyClient.exe`.
No installs: push this folder to a GitHub repo, open Actions > "Build PartyClient.exe" > Run workflow, download the artifact.

## 1. Build the client mod (needs JDK 17+ and Gradle 8.x, internet)
```
./build-client.sh
```
This produces `partyclient-1.0.0+mc1.20.1.jar` and copies it to `launcher/bundled/`.

## 2. Run the launcher (needs Node 18+)
```
cd launcher
npm install
npm start          # or: npm run dist   to make an installer
```
Sign in with Microsoft, pick a version, press Play. The launcher installs Fabric Loader,
Fabric API and (if a matching jar is in `bundled/`) the Party Client mod automatically.
Java: the launcher downloads Java 21 automatically on first launch (works for all supported versions). You can override it with a Java path in Settings.

## In game
* Title screen: click/press a key at "Press to enter", then Singleplayer / Multiplayer / Minecraft Settings / **Client** / Quit.
* **Mods menu**: Right Shift in game, the "Party Mods" button in the pause menu, or "Client" on the title screen.
* Mods: Party Title Screen, Info HUD (FPS/ping), Player Effects (5 ring styles), **Death Animation**
  (Tung Tung Sahur + bat, toggle on/off), Stretch Screen (slider), Zoom (hold C), Fullbright.
* Settings are saved to `config/partyclient.json`.

## Customising
* Death animation art: replace `client/src/main/resources/assets/partyclient/textures/gui/tts_0/1/2.png`
  (64x64: idle, bat raised, swing). The ones included are simple placeholder pixel art.
  Hit sound: `assets/partyclient/sounds/tung.ogg`.
* Logo: `textures/gui/logo_white.png` (client) and `launcher/assets/logo.png`.

## Supporting more Minecraft versions
The launcher lists every Fabric-supported release from 1.20.1 upward (fetched live from Mojang + Fabric).
Fabric/Minecraft internals change between versions, so the mod must be built per version: change
`minecraft_version`, `yarn_mappings`, `fabric_version` in `client/gradle.properties`
(see https://fabricmc.net/develop), fix any compile errors, run `./build-client.sh`.
Versions without a bundled jar still launch as clean Fabric (the launcher shows a notice).
