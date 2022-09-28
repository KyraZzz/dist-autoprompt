#!/bin/bash
# Task: sentiment analysis
# Model: RoBERTa-large
# Iters: 180

datadir=$1
logfile=$2

# Clear files
cat /dev/null > $logfile
cat /dev/null > ${logfile}.log

for path in $datadir/*; do
    time CUDA_VISIBLE_DEVICES=4 python -m autoprompt.create_trigger \
        --train $path/SST-2/train.tsv \
        --dev $path/SST-2/dev.tsv \
        --template '<s> {sentence} [T] [T] [T] [P] . </s>' \
        --label-map '{"0": ["Ġworse", "Ġincompetence", "ĠWorse", "Ġblamed", "Ġsucked"], "1": ["ĠCris", "Ġmarvelous", "Ġphilanthrop", "Ġvisionary", "Ġwonderful"]}' \
        --num-cand 100 \
        --accumulation-steps 30 \
        --bsz 24 \
        --eval-size 48 \
        --iters 180 \
        --model-name roberta-large
        --use-ctx >> $logfile 2>> ${logfile}.log
done