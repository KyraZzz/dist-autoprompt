dir=$PWD
month_day=$(date +"%b_%d")
time=$(date +%s)
echo "run job "$time
mkdir -p cl_job_output/${month_day}
touch ./cl_job_output/${month_day}/log_${time}.out

cd /local/scratch-3/yz709/dist-autoprompt/autoprompt

python -m label_search \
    --train /local/scratch-3/yz709/dist-autoprompt/data/SST-2/train.tsv \
    --template '[CLS] {sentence} [T] [T] [T] [P]. [SEP]' \
    --label-map '{"0": 0, "1": 1}' \
    --iters 50 \
    --model-name 'roberta-base' \
    1> ${dir}/cl_job_output/${month_day}/log_${time}.out 2>&1