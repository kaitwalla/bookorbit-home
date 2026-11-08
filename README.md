# BookOrbit Home

Kindle Scribe-first KOReader plugin prototype for a BookOrbit-focused home experience.

## Current state

Phase 0 shell only. Menu entries are placeholders. There is no BookOrbit API integration, automatic startup replacement, or on-device validation yet.

## CI

GitHub Actions checks Lua 5.1 syntax, runs mocked smoke tests, packages the plugin directory as a ZIP artifact, and publishes tagged releases.

## Install

Extract the package and copy the `bookorbit-home.koplugin` directory into KOReader's `plugins/` directory. Restart KOReader, then open BookOrbit Home from the tools menu. To revert, disable or remove the plugin.

## Development

Run `lua5.1 tests/smoke.lua` and `bash scripts/package.sh`. Smoke tests use mocks and do not establish Kindle Scribe compatibility.

## Roadmap

1. Audit official BookOrbit KOReader plugin entry points and runtime access.
2. Implement native home UI and BookOrbit adapter.
3. Validate on jailbroken Kindle Scribe 2024.
4. Test offline reading, progress sync, sleep/wake, and rollback.
