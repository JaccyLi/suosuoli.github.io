#!/bin/bash

# FFI Casting Images Download Script
# Downloads all FFI casting definition images using proxy

PROXY="http://localhost:7890"
OUTPUT_DIR="/mnt/d/data/blog/hugo-bearneo/HookedLee/static/img/ffi-casting"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

cd "$OUTPUT_DIR" || exit

echo "Downloading FFI Casting Definition images..."
echo "Using proxy: $PROXY"
echo "Output directory: $OUTPUT_DIR"
echo ""

# Array of image URLs
declare -a URLS=(
  "https://www.flyfishersinternational.org/portals/0/FlyCastingEducation/Images/CastingDefinitions/Casting_Arc.png"
  "https://www.flyfishersinternational.org/portals/0/FlyCastingEducation/Images/CastingDefinitions/Casting_Concave.png"
  "https://www.flyfishersinternational.org/portals/0/FlyCastingEducation/Images/CastingDefinitions/Casting_Convex.png"
  "https://www.flyfishersinternational.org/portals/0/FlyCastingEducation/Images/CastingDefinitions/Casting_Drag.png"
  "https://www.flyfishersinternational.org/portals/0/FlyCastingEducation/Images/CastingDefinitions/Casting_Drift.png"
  "https://www.flyfishersinternational.org/portals/0/FlyCastingEducation/Images/CastingDefinitions/Casting_Plane_InPlaneLoop.png"
  "https://www.flyfishersinternational.org/portals/0/FlyCastingEducation/Images/CastingDefinitions/Casting_Plane_OutOfPlaneLoop.png"
  "https://www.flyfishersinternational.org/portals/0/FlyCastingEducation/Images/CastingDefinitions/Casting_StraightFlyLegA.png"
  "https://www.flyfishersinternational.org/portals/0/FlyCastingEducation/Images/CastingDefinitions/Casting_StraightFlyLegB.png"
  "https://www.flyfishersinternational.org/portals/0/FlyCastingEducation/Images/CastingDefinitions/Casting_StrokeLength.png"
  "https://www.flyfishersinternational.org/portals/0/FlyCastingEducation/Images/CastingDefinitions/Casting_TailingLoop.png"
  "https://www.flyfishersinternational.org/portals/0/FlyCastingEducation/Images/CastingDefinitions/Casting_TrailingLoopA.png"
  "https://www.flyfishersinternational.org/portals/0/FlyCastingEducation/Images/CastingDefinitions/Casting_TrailingLoopB.png"
  "https://www.flyfishersinternational.org/portals/0/FlyCastingEducation/Images/CastingDefinitions/Casting_Underslung.png"
)

success_count=0
failure_count=0

# Download each image
for url in "${URLS[@]}"; do
  filename=$(basename "$url")

  echo -n "Downloading: $filename..."

  if curl -x "$PROXY" -o "$filename" --max-time 30 -L "$url" -s -w "%{http_code}"| grep -q "200"; then
    # Success - file downloaded
    size=$(ls -lh "$filename" | awk '{print $5}')
    echo "  ✓ SUCCESS: $filename ($(du -h "$filename" | cut -f1))"
    ((success_count++))
  else
    echo "  ✗ FAILED: $filename"
    ((failure_count++))
  fi
done

echo ""
echo "=== Download Summary ==="
echo "Total images: ${#URLS[@]}"
echo "Success: $success_count"
echo "Failed: $failure_count"
echo ""

if [ $success_count -eq ${#URLS[@]} ]; then
  echo "All images downloaded successfully!"
  exit 0
else
  echo "Some downloads failed. You may need to retry failed URLs manually."
  exit 1
fi
