#!/usr/bin/env bash

# Minimal battery status (reads BAT0 status and capacity)

# Useful for minimal (server) environments running on laptops.


BAT="/sys/class/power_supply/BAT0"

while true; do
  clear
  echo "------------------------------------------------------------"
  echo " Battery Status"
  echo "------------------------------------------------------------"

  # Read parameters
  STATUS="N/A"
  CAPACITY="0"
  [ -r "$BAT/status" ]   && STATUS="$(cat "$BAT/status")"
  [ -r "$BAT/capacity" ] && CAPACITY="$(cat "$BAT/capacity")"

  # Build a simple capacity bar
  FILLED=$(( CAPACITY / 5 ))         # 0..20
  [ $FILLED -gt 20 ] && FILLED=20
  EMPTY=$(( 20 - FILLED ))

  BAR="["
  for _ in $(seq 1 $FILLED); do BAR="${BAR}#"; done
  for _ in $(seq 1 $EMPTY);  do BAR="${BAR}-"; done
  BAR="${BAR}]"

  printf " State     : %s\n" "$STATUS"
  printf " Capacity  : %s%%  %s\n" "$CAPACITY" "$BAR"

  echo
  echo "------------------------------------------------------------"
  sleep 30
done

