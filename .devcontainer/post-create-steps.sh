#!/bin/bash

# suppress this noise warning; using latest in Docker image
export PIP_DISABLE_PIP_VERSION_CHECK=1

# allow git to run in devcontainer as vscode
git config --global --add safe.directory "*"

# dependency installation
echo "Installing dependencies"
rm -rf venv
python -m venv venv
source venv/bin/activate
pip install -U pip wheel build flake8 flake8-rst-docstrings ipykernel nbstripout pytest pre-commit
pip install -e .

echo "Installing pre-commit hooks"
pre-commit install --hook-type pre-commit --hook-type pre-push
