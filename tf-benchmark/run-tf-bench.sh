#!/bin/bash

cd /data/benchmarks/scripts/tf_cnn_benchmarks

case "${MODE}" in 
	"cifar10" )
		for model in resnet20 resnet32 resnet44 resnet56 resnet110 densenet40_k12 densenet100_k12 densenet100_k24; do

			echo "Running model $model"
			python tf_cnn_benchmarks.py \
				--local_parameter_device=gpu \
				--num_gpus=1 \
				--batch_size=32 \
				--variable_update=replicated \
				--data_dir=/data/cifar10/ \
				--data_name=cifar10 \
				--model=${model}

				sleep 1
		done 
	;;
	* ) 
		for model in vgg11 vgg16 vgg19 lenet googlenet overfeat alexnet trivial inception4 inception3 reset50 resnet101 resnet152; do
			echo "Running model $model"
			python tf_cnn_benchmarks.py \
				--local_parameter_device=gpu \
				--num_gpus=1 \
				--batch_size=32 \
				--variable_update=replicated \
				--model=${model}
			sleep 1 
		done 
	;;
esac
