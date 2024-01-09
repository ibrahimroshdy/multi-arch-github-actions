# Continuous Integration 
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
[![Continuous Integration](https://github.com/ibrahimroshdy/continuous_integration/actions/workflows/ci_workflow.yml/badge.svg?branch=main)](https://github.com/ibrahimroshdy/continuous_integration/actions/workflows/ci_workflow.yml)
[![codecov](https://codecov.io/gh/ibrahimroshdy/continuous_integration/branch/main/graph/badge.svg?token=Y56VABDZA7)](https://codecov.io/gh/ibrahimroshdy/continuous_integration)

## About
A sample project of adding continuous integration 
to GitHub and utilising the GitHub actions, workflows and job settings.
This project contains a `simple_loop.py` python file that prints a progress bar of a for loop.
The aim of this project to serve a sample project for implementing GitHub's 
workflow using workflow files, and custom actions and multiple jobs.

### Folder Structure 
```
continuous_integration
│
├── README.md
├── .github # gitHub workflow directory
│     ├── actions # Custom actions directory
│     │   └── install-run-code # This project's Custom Action to be referred to by name in workflows
│     │       └── action.yml # Action instructions file [Must be named action]
│     └── workflows # This project's Workflows 
│         └── ci_workflow.yml # Workflow instructions file
├── .gitignore
├── pyproject.toml
└── simple_loop.py
```


### Getting Started 

There is no need to run the project locally, but in case it is needed here is the quick start instructions used. 
Note: Those are the same instructions in `.github/workflows/ci_workflows.yml` and `.github/actions/install-run-code/actions.yml`

Project is also setup for a Docker Multi-arch build for `arm64` and `amd64`. Read more about it in this [article](https://ibrahimroshdy.medium.com/how-to-build-your-docker-images-using-multi-arch-to-support-arm64-m1-macbook-6ebc42a47cd7).

Create a virtualenv 
```bash
 virtualenv venv -p python3
```

Activate your venv
```bash
source venv/bin/activate
```

Install poetry and pyfiglet using pip
```bash
pip install poetry pyfiglet
```

Run poetry install to install all needed python packages
```bash
poetry install
```

Run pyfiglet because you can 
```bash
pyfiglet Continuous Integration
```

Finally, run code
```bash
python simple_loop.py
```

You should have something like that: 

```bash
This is a progress bar of the simple loop script
100%|███████| 1000000/1000000 [00:00<00:00, 4474649.76it/s]
```
