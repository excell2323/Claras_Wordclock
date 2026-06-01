#!/usr/bin/env sh
set -eu

mkdir -p patches
cat patches/lafvin-ai-chatbot-openai-realtime.patch.b64.part-* | base64 -d > patches/lafvin-ai-chatbot-openai-realtime.patch
base64 -d patches/xiaozhi-esp32-server-openai-bridge.patch.b64 > patches/xiaozhi-esp32-server-openai-bridge.patch

printf 'Restored patch files in patches/.\n'
