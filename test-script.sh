#!/bin/sh

cd ohri/forms/ || exit
json_data="$(cat covid-assessment-summary.json)"
echo "data is:  ". "$json_data"