#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --gres=gpu
#SBATCH --time=47:59:59
#SBATCH --mem=10GB
#SBATCH --job-name=CycleGAN-p2c


cd /scratch/hq443/PyTorch-CycleGAN-p2c
conda activate /scratch/hq443/conda_envs/torch-p2c
python train.py --dataroot datasets/p2c/ --cuda