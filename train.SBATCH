#!/bin/bash
#SBATCH --job-name=cyclegan_p2c
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --mem=12GB
#SBATCH --time=120:00:00
#SBATCH --mail-type=END
#SBATCH --mail-user=hq443@nyu.edu # put your email here if you want emails
#SBATCH --output=slurm.out
#SBATCH --error=slurm.err
#SBATCH --gres=gpu:1 # How much gpu need, n is the number
#SBATCH -p aquila
#SBATCH --constraint=2080Ti


module purge
module load anaconda3
module load cuda

echo "start training"
cd /gpfsnyu/scratch/hq443/PyTorch-CycleGAN-p2c
source activate /scratch/hq443/conda_envs/torch-p2c
python train.py --dataroot datasets/p2c/ --cuda

echo "end training"