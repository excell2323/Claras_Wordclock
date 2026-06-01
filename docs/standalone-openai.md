# Standalone OpenAI Notes

The Python Xiaozhi server cannot realistically run on the ESP32-S3. The
standalone direction is therefore to replace the local Xiaozhi websocket protocol
with a direct OpenAI Realtime websocket protocol inside the firmware.

## Tradeoffs

- No local server is needed once the device is provisioned.
- The OpenAI API key must be stored on the ESP32-S3, so it is extractable from a
  physical device. For a child-safe production clock, an ephemeral-token service
  would be safer, but that would again require a server.
- The direct protocol currently uses PCM16 at 24 kHz instead of Opus.
- Runtime behavior still needs testing against the live OpenAI Realtime API.

## Firmware Settings

The firmware patch reads these values from the ESP-IDF NVS namespace `openai`:

- `enabled`: `true` switches from the Xiaozhi server protocol to OpenAI Realtime.
- `api_key`: OpenAI API key.
- `model`: defaults to `gpt-realtime-mini`.
- `voice`: defaults to `marin`.
- `input_sample_rate`: defaults to `24000`.
- `output_sample_rate`: defaults to `24000`.
- `instructions`: optional assistant instructions for the wordclock voice.
- `url`: optional websocket URL override.

The OTA parser can already persist an `openai` object into NVS. A small
provisioning step is still needed so the device receives those settings once,
then boots directly into OpenAI mode afterward.
