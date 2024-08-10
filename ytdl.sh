#!/bin/bash

# Check if the link is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <video_url>"
  exit 1
fi

VIDEO_URL=$1
FILENAME=$2

# Download the video using yt-dlp
echo "Downloading video..."
yt-dlp -o "video.%(ext)s" $VIDEO_URL

# Extract audio using ffmpeg
echo "Extracting audio..."
ffmpeg -i video.* -q:a 0 -map a $FILENAME

# Clean up the downloaded video file
rm video.*

echo "Audio extraction complete. Saved as audio.mp3"
