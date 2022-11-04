dir=$PWD
month_day=$(date +"%b_%d")
time=$(date +%s)
echo "run job "$time
mkdir -p cl_job_output/${month_day}
touch ./cl_job_output/${month_day}/log_${time}.out

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
    --iters 1 \
    --model-name roberta-base \
    1> ${dir}/cl_job_output/${month_day}/log_${time}.out 2>&1