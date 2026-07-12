</> Markdown

# Azure Containers Lab

## Objective
Build a Docker image, push it to Azure Container Registry, and deploy it using Azure Container Instances.

## What I Learned
- Docker Desktop is required for local Docker build and push workflows.
- Azure Cloud Shell does not support the Docker daemon.
- Azure Container Registry stores container images.
- Azure Container Instances runs containers without managing virtual machines.
- Resource providers may need to be registered before using ACR or ACI.

## Troubleshooting
- Dockerfile must be named exactly Dockerfile, not Dockerfile.txt.
- az acr login requires Docker Desktop to be running locally.
- Cloud Shell can use Azure CLI but cannot run local Docker build/push commands.

## Exam Notes
- ACI is used for simple container workloads with low administrative overhead.
- ACR is a private registry for storing container images.
- AKS is used for full Kubernetes orchestration.
- Container Apps are used for scalable/serverless containerized applications.

## Cleanup
Deleted the lab resource group after completion to control costs.