#!/bin/bash

# Create the timeline table using the files:
# TimelineOfComputerScience.imagesources.txt and ImageSourcesToTable.awk

# Sort in date order (ignoring BCE edge case)
sort -n TimelineOfComputerScience.imagesources.txt >TimelineOfComputerScience.imagesources.sorted.txt

# Create table
awk -f ImageSourcesToTable.awk <TimelineOfComputerScience.imagesources.sorted.txt >imagesourcetable.tex

# Clean-up
rm TimelineOfComputerScience.imagesources.sorted.txt

# Paste the imagesourcetable.tex into the LaTex document

