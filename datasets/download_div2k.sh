#!/bin/bash

# Define an array of the file names
files=("DIV2K_train_HR" "DIV2K_valid_HR" "DIV2K_train_LR_bicubic_X2" "DIV2K_train_LR_bicubic_X3" "DIV2K_train_LR_bicubic_X4" "DIV2K_valid_LR_bicubic_X2" "DIV2K_valid_LR_bicubic_X3" "DIV2K_valid_LR_bicubic_X4")

# Check if the directory exists and create it if it doesn't
if [ ! -d "./data/DIV2K/" ]; then
  mkdir -p ./data/DIV2K/
fi

# Loop through the array and process each file
for file in "${files[@]}"; do
    # Check if the unzipped directory exists
    if [ ! -d "./data/DIV2K/${file}" ]; then
        # Download the file
        wget http://data.vision.ee.ethz.ch/cvl/DIV2K/${file}.zip

        # Unzip the file
        unzip ${file}.zip -d ./data/DIV2K/

        # Remove the zip file
        rm ${file}.zip
    fi
done
