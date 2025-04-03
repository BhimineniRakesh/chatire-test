#!/bin/bash

# Start time: December 7, 2024 at 00:00
start_time="2025-04-03T10:20:50"

# Convert start time to epoch seconds
current_epoch=$(date -d "$start_time" +%s)

# Loop over each file in current directory (non-recursive)
for file in *; do
  if [ -f "$file" ]; then
    # Convert epoch back to formatted date
    timestamp=$(date -d "@$current_epoch" --iso-8601=seconds)

    # Set git date environment variables
    GIT_AUTHOR_DATE="$timestamp" GIT_COMMITTER_DATE="$timestamp" git add "$file"
    GIT_AUTHOR_DATE="$timestamp" GIT_COMMITTER_DATE="$timestamp" git commit -m "Add $file"

    # Increment time by 5 minutes (300 seconds)
    current_epoch=$((current_epoch + 300))
  fi
done

