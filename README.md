# Claras Wordclock

ESP32-S3 wordclock experiment based on the LAFVIN AI Chatbot Kit.

This repository stores the project notes and local patches used while turning the
LAFVIN / Xiaozhi voice assistant demo into a speech layer for a wordclock.

## Current State

- Hardware: LAFVIN AI Chatbot Kit with ESP32-S3, chatbot shield and audio codec module.
- Wake word: `Hi ESP`.
- Local server mode: Xiaozhi server patched to work with OpenAI and 24 kHz output.
- Firmware mode: proof-of-concept OpenAI Realtime protocol path compiled successfully.
- The direct OpenAI path is compile-verified, but still needs runtime testing on the ESP32-S3.

## Repository Layout

- `patches/lafvin-ai-chatbot-openai-realtime.patch`: firmware changes against
  `lafvintech/LAFVIN-AI-Chatbot`, branch `src`.
- `patches/xiaozhi-esp32-server-openai-bridge.patch`: local server changes against
  `xinnan-tech/xiaozhi-esp32-server`, branch `main`.
- `docs/standalone-openai.md`: notes about making the ESP32-S3 run without the local server.

The ESP-IDF toolchain, local build folders, virtual environments and API keys are
not stored in this repository.

## Upstream Bases

- Firmware: `https://github.com/lafvintech/LAFVIN-AI-Chatbot.git`
  at commit `b5b70fd` (`src`)
- Server: `https://github.com/xinnan-tech/xiaozhi-esp32-server.git`
  at commit `f42088ef` (`main`)

## Build Notes

The last successful firmware build used ESP-IDF `v5.5.2` and the LAFVIN chatbot
target:

```sh
idf.py build
```

The generated app binary was about `0x2b5990` bytes and still fit into the app
partition with roughly 31% free space.
