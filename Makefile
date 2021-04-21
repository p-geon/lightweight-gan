export NAME_CONTAINER=hyperpigeon/pytorch_lwgan
export PWD=`pwd`

build:
	docker build -f Dockerfile -t $(NAME_CONTAINER) .

run:
	docker run -it --rm --gpus all \
		-v $(PWD):/work \
		--memory=10240mb \
		$(NAME_CONTAINER) \
		lightweight_gan \
			--data ./data/lsun_data \
			--name trial_1 \
			--batch-size 16 \
			--gradient-accumulate-every 4 \
			--num-train-steps 200000