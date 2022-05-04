#!/bin/bash
#SBATCH --job-name=pca9_gau_rn
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --mem=44GB
#SBATCH --time=120:00:00
#SBATCH --mail-type=END
#SBATCH --mail-user=hq443@nyu.edu # put your email here if you want emails
# SBATCH --output=pca9_gau_rn.out
# SBATCH --error=pca9_gau_rn.err
#SBATCH --gres=gpu:2 # How much gpu need, n is the number
#SBATCH -p gpu
#SBATCH --constraint=3080Ti

echo "Your NetID is: $1"
echo "Your environment is: $2"

module purge
module load anaconda3
module load cuda

echo "start training"
echo "your GPU is:"
ls /dev/cu*

cd /scratch/hq443/PyTorch-CycleGAN-p2c
conda activate /scratch/hq443/conda_envs/torch-p2c
python train.py --dataroot datasets/p2c/ --cuda

echo "end training"