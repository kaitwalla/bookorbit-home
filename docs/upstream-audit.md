# Upstream integration audit (2026-11-08)

## Source inspected
- [BookOrbit KOReader plugin main.lua](https://github.com/bookorbit/bookorbit/blob/main/koreader-plugin/bookorbit.koplugin/main.lua)
- [BookOrbit KOReader plugin README](https://github.com/bookorbit/bookorbit/blob/main/koreader-plugin/README.md)
- [BookOrbit main menu](https://github.com/bookorbit/bookorbit/blob/main/koreader-plugin/bookorbit.koplugin/bookorbit_main_menu.lua)

## Confirmed capabilities
- Official plugin version in inspected main.lua: 2.2.0.
- The plugin already implements a four-page configurable dashboard, cover grids, cached catalog opening, search, collections, series, downloads, and a startup/home option.
- `BookOrbit:browseCatalog(prefer_cached_dashboard)` exists and handles logged-out state.
- `MainMenu:openBookOrbit()` exists and handles sign-in.
- `catalog_auto_open` is an official setting.
- The official plugin owns progress, highlights, status, and reading-time sync.

## Integration risk
Neither `browseCatalog` nor `openBookOrbit` is documented as a public cross-plugin API. A KOReader plugin class loaded with `require` is NOT the live plugin instance and must not be instantiated just to call these methods. Avoid reading credentials or duplicating BookOrbit's client.

## Revised plan
1. Confirm the KOReader runtime's plugin instance registry and lifecycle, including startup order.
2. Build a read-only adapter to find the live BookOrbit plugin, if a supported registry exists.
3. Add a guarded launcher that delegates to the live instance. If absent, show a helpful error.
4. Build Scribe-specific navigation/appearance around official BookOrbit screens, with no second sync implementation.
5. Only replace the dashboard if the official UI cannot be adapted to requirements.

## Device validation
Hardware is assumed jailbroken for development. Actual Scribe 2024 firmware, launcher, KOReader build, sleep/wake, and plugin compatibility remain unverified.
