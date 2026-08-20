#!/usr/bin/env sh
ai-usagebar --vendor anthropic --icon '󰚩' --color-low '#eeeeee' --color-mid '#ffee88' --color-high '#ff8888' --color-critical '#ff4444' --json | jq -r '.text'
