#!/bin/bash

input_folder="assets/videos"
output_folder="assets/images/first_frames"

# Check if the input folder exists
if [ -d "$input_folder" ]; then
    # Create the output folder if it doesn't exist
    mkdir -p "$output_folder"

    # Iterate over video files in the input folder
    for video_file in "$input_folder"/*.mp4; do
        # Extract video name without extension
        video_name=$(basename "${video_file%.*}")

        # Specify the output file for the frame
        output_file="$output_folder/${video_name}-first-frame.jpg"

        # Run FFmpeg command to extract the first frame
        ffmpeg -i "$video_file" -ss 00:00:01 -vframes 1 "$output_file"

        echo "Extracted frame from '$video_name' and saved as '$output_file'"
    done
else
    echo "Error: The folder '$input_folder' does not exist."
fi
