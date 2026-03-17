bash
#!/bin/bash
set -e  # abort on error

# === Step 1: System prep (only if base image is minimal) ===
if [ ! -f /usr/local/cuda/bin/nvcc ]; then
  sudo apt update
  # install NVIDIA driver, CUDA, etc.
  # or if using yum / dnf based
fi

# === Step 2: Prepare environment (conda or venv) ===
if [ ! -d ~/my_env ]; then
  conda create -y -n my_env python=3.10
fi
source activate my_env

# === Step 3: Install Python / ML dependencies ===
# use a requirements.txt or environment.yml
conda install -y --file env_requirements.txt
pip install -r requirements.txt

# === Step 4: Download models/data ===
if [ ! -f /mnt/data/my_model.pt ]; then
  wget ... -P /mnt/data
fi

# === Step 5: Post setup tasks ===
# Cleanup, logging, training loop bootstraps, etc.
```

And in GitHub Actions:

```yaml
name: Setup Environment

on:
  workflow_dispatch:
    inputs:
      fast: boolean

jobs:
  prep:
    runs-on: ubuntu-20.04 # or GPU enabled runner (if supported)

    steps:
      - uses: actions/checkout@v3
      - name: Setup GPU drivers & CUDA
        run: ./scripts/install_cuda.sh

      - name: Setup conda
        run: ...
        uses: ...

      - name: Cache dependencies
        uses: actions/cache@v3
        with:
          path: ~/.conda/envs/my_env
          key: ${{ runner.os }}-conda-${{ hashFiles('environment.yml') }}

      - name: Install dependencies
        run: conda env update --file environment.yml

      - name: Pull models/data
        if: ${{ ! inputs.fast }}
        run: ./scripts/download_models.sh

