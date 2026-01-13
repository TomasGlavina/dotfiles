#!/bin/bash

MODE=$1

# ---------- helpers ----------

get_tuned_profile() {
  if ! command -v tuned-adm >/dev/null 2>&1; then
    echo "unknown"
    return
  fi
  # tuned-adm active -> "Current active profile: balanced"
  tuned-adm active 2>/dev/null | awk '/profile:/ {print $4}'
}

set_tuned_profile() {
  local profile="$1"
  if command -v tuned-adm >/dev/null 2>&1; then
    tuned-adm profile "$profile" >/dev/null 2>&1
  fi
}

get_battery_path() {
  upower -e | grep 'BAT' | head -n1
}

get_battery_info() {
  local BATTERY
  BATTERY=$(get_battery_path) || return 1

  PERCENT=$(upower -i "$BATTERY" | awk '/percentage/ {gsub("%","",$2); print $2}')
  STATE=$(upower -i "$BATTERY"   | awk '/state/      {print $2}')

  echo "$PERCENT" "$STATE"
}

get_battery_class() {
  local PERCENT="$1"
  local STATE="$2"
  local CLASS

  if [[ $PERCENT -ge 95 && $STATE == "fully-charged" ]]; then
    CLASS="full"
  elif [[ $STATE == "charging" ]]; then
    CLASS="charging"
  elif [[ $PERCENT -le 10 ]]; then
    CLASS="critical"
  elif [[ $PERCENT -le 15 ]]; then
    CLASS="warning"
  else
    CLASS="discharging"
  fi

  echo "$CLASS"
}

# ---------- modes ----------

# Toggle power profile via tuned
if [[ "$MODE" == "toggle" ]]; then
  PROFILE=$(get_tuned_profile)

  case "$PROFILE" in
    powersave)
      set_tuned_profile balanced
      ;;
    balanced)
      set_tuned_profile performance
      ;;
    performance|latency-performance|throughput-performance)
      set_tuned_profile powersave
      ;;
    *)
      # fallback
      set_tuned_profile balanced
      ;;
  esac

  exit 0
fi

# Read battery info once for the other modes
read PERCENT STATE < <(get_battery_info || echo "0 unknown")
CLASS=$(get_battery_class "$PERCENT" "$STATE")
PROFILE=$(get_tuned_profile)

# Icon based on tuned profile
get_profile_icon() {
  local profile="$1"
  case "$profile" in
    powersave*)
      echo ""    # leaf
      ;;
    balanced*)
      echo ""    # scales
      ;;
    performance*|latency-performance*|throughput-performance*)
      echo ""    # lightning
      ;;
    *)
      echo ""    # question mark
      ;;
  esac
}

ICON=$(get_profile_icon "$PROFILE")

# ---------- profile mode: icon + percent ----------
if [[ "$MODE" == "profile" ]]; then
  # Example JSON for Waybar custom module (return-type: json)
  printf '{"text": "%s %s%%", "class": "%s", "alt": "%s"}\n' \
    "$ICON" "$PERCENT" "$CLASS" "$PROFILE"
  exit 0
fi

# ---------- bar mode: percentage only ----------
if [[ "$MODE" == "bar" ]]; then
  # For use with a "percentage" style indicator
  printf '{"percentage": %s, "class": "%s"}\n' "$PERCENT" "$CLASS"
  exit 0
fi

# Default: just dump percentage (fallback)
echo "$PERCENT"

