#!/bin/bash

# Script to join all GeoJSON files into a single GeoJSONL file
# Each feature gets a "layer" property based on the source filename

OUTPUT_FILE="data/Amrit_Sarovar_Water_Observatory.geojsonl"

# Remove output file if it exists
rm -f "$OUTPUT_FILE"

# Process each geojson file in the data/geojsons directory
for geojson_file in data/geojsons/*.geojson; do
    # Extract the filename without path and extension
    layer_name=$(basename "$geojson_file" .geojson)
    
    echo "Processing $layer_name..."
    
    # Use jq to extract features, add layer property, and output as GeoJSONL
    jq -c --arg layer "$layer_name" '.features[] | .properties.layer = $layer | .' "$geojson_file" >> "$OUTPUT_FILE"
done

echo "Done! Created $OUTPUT_FILE"
echo "Total features: $(wc -l < "$OUTPUT_FILE")"
