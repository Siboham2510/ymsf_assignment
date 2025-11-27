#!/bin/bash
set -e

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTFILE="./output/results_$TIMESTAMP.csv"

echo "Running YMS simulation..."

python code/final_sim.py \
    --data_folder ./data/customdata_new \
    --result_folder ./output \
    --prefix mr_spread_dynamic

echo "Combining results..."

python3 code/combine_results.py \
    --result_folder ./output \
    --prefix mr_spread_dynamic

mv ./output/mr_spread_dynamic_leaderboard_overall.csv $OUTFILE

echo "Done!"
echo "Final output saved as $OUTFILE"

###############################################
# MINIMAL VERSION (REFERENCE ONLY)
# This version just runs final_sim.py and writes
# results.csv inside ./output/
#
# python code/final_sim.py \
#     --data_folder ./data/customdata_new \
#     --result_folder ./output
#
# echo "Done!"
###############################################
