cd /local/scratch-3/yz709/dist-autoprompt/autoprompt
python -m create_trigger \
    --train /local/scratch-3/yz709/dist-autoprompt/data/SST-2/train.tsv \
    --dev /local/scratch-3/yz709/dist-autoprompt/data/SST-2/dev.tsv \
    --template '<s> {sentence} [T] [T] [T] [P] . </s>' \
    --label-map '{"0": ["Ġworse", "Ġincompetence", "ĠWorse", "Ġblamed", "Ġsucked"], "1": ["ĠCris", "Ġmarvelous", "Ġphilanthrop", "Ġvisionary", "Ġwonderful"]}' \
    --num-cand 100 \
    --accumulation-steps 30 \
    --bsz 24 \
    --eval-size 48 \
    --iters 2 \
    --model-name roberta-base