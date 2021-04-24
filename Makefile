export NAME_CONTAINER=hyperpigeon/pytorch_lwgan
export PWD=`pwd`

build:
	docker build -f Dockerfile -t $(NAME_CONTAINER) .

run:
	docker run -it --rm --gpus all \
		-v $(PWD):/work \
        --cpuset-cpus 0-8 \
        --memory=48gb \
		$(NAME_CONTAINER) \
		lightweight_gan \
			--data ./data/lsunx5000 \
			--name trial_1 \
			--batch-size 16 \
			--gradient-accumulate-every 4 \
			--num-train-steps 200000 \
			--num_workers=1 \
			--multi_gpus True \
			--aug-prob 0.25 --aug-types [translation,cutout,color]

export NAME_CONTAINER=hyperpigeon/pytorch_lwgan
export PWD=`pwd`

build:
	docker build -f Dockerfile -t $(NAME_CONTAINER) .

run:
	docker run -it --rm --gpus all \
		-v $(PWD):/work \
        --cpuset-cpus 0-8 \
        --memory=48gb \
		$(NAME_CONTAINER) \
		lightweight_gan \
			--data ./data/lsun_data \
			--name trial_1 \
			--batch-size 16 \
			--gradient-accumulate-every 4 \
			--num-train-steps 200000 \
			--num_workers=1 \
			--multi_gpus True \
			--aug-prob 0.25 --aug-types [translation,cutout,color]
