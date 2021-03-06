#!/usr/bin/env bash
export OUTPUT_DIR_NAME=bart_utest_output
export CURRENT_DIR=${PWD}
export OUTPUT_DIR=${CURRENT_DIR}/${OUTPUT_DIR_NAME}

if [ -d "$OUTPUT_DIR" ]; then rm -Rf $OUTPUT_DIR; fi

# Make output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Add parent directory to python path to access lightning_base.py and utils.py
export PYTHONPATH="../../":"${PYTHONPATH}"
python finetune.py \
--data_dir=train_test_data/ \
--model_name_or_path=facebook/bart-large-cnn  \
--learning_rate=1e-3 \
--train_batch_size=4 \
--eval_batch_size=4 \
--output_dir=$OUTPUT_DIR \
--num_train_epochs=200  \
--n_gpu=8 \
--do_train \
--do_predict $@

#facebook/bart-large-cnn
# --data_dir=cnn_tiny/ \
