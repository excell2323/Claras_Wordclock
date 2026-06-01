# Claras Wordclock

ESP32-S3 wordclock experiment based on the LAFVIN AI Chatbot Kit.

This repository stores the project notes for turning the LAFVIN / Xiaozhi voice
assistant demo into a speech layer for a wordclock.

## Current State

- Hardware: LAFVIN AI Chatbot Kit with ESP32-S3, chatbot shield and audio codec module.
- Wake word: `Hi ESP`.
- Local server mode: Xiaozhi server patched to work with OpenAI and 24 kHz output.
- Firmware mode: proof-of-concept OpenAI Realtime protocol path compiled successfully locally.
- The direct OpenAI path is compile-verified, but still needs runtime testing on the ESP32-S3.

## Repository Layout

- `docs/standalone-openai.md`: notes about making the ESP32-S3 run without the local server.
- `patches/xiaozhi-esp32-server-openai-bridge.patch.b64`: base64-encoded local server patch.

The complete local publication bundle, including the larger firmware patch, is
prepared at `/private/tmp/claras-wordclock-github`. It still needs an authenticated
Git push from the Mac because the GitHub CLI is not installed and no HTTPS GitHub
credentials are available in this shell.

The ESP-IDF toolchain, local build folders, virtual environments and API keys are
not stored in this repository.

## Upstream Bases

- Firmware: `https://github.com/lafvintech/LAFVIN-AI-Chatbot.git`
  at commit `b5b70fd` (`src`)
- Server: `https://github.com/xinnan-tech/xiaozhi-esp32-server.git`
  at commit `f42088ef` (`main`)

## Restore Server Patch

```sh
base64 -d patches/xiaozhi-esp32-server-openai-bridge.patch.b64 > patches/xiaozhi-esp32-server-openai-bridge.patch
```

## Build Notes

The last successful firmware build used ESP-IDF `v5.5.2` and the LAFVIN chatbot
target:

```sh
idf.py build
```

The generated app binary was about `0x2b5990` bytes and still fit into the app
partition with roughly 31% free space.
