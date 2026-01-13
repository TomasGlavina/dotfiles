#!/bin/bash

SHORT=$(date '+%a %d %H:%M' | tr '[:upper:]' '[:lower:]')
LONG=$(date '+%A %d %H:%M' | tr '[:upper:]' '[:lower:]')

printf '{"text": "%s", "alt": "%s"}\n' "$SHORT" "$LONG"
