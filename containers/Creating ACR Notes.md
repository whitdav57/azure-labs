# Azure Containers Lab

## Objective
Deploy a containerized web application using Azure Container Registry and Azure Container Instances.

## Services Used
- Azure Container Registry
- Azure Container Instances
- Docker
- Azure CLI

## What I Learned
- Docker images can be built locally and pushed to Azure Container Registry.
- Azure Container Registry stores private container images.
- Azure Container Instances can run containers without managing virtual machines.
- ACI is useful for simple container workloads and quick testing.

## Exam Notes
- ACI is the fastest way to run a container in Azure without managing servers.
- ACR is a private container registry for storing Docker images.
- Container groups can share networking and storage.
- AKS is used for more complex Kubernetes orchestration.
- Container Apps are used for serverless containerized applications and microservices.

## Cleanup
Deleted the resource group after completing the lab to avoid ongoing costs.


docker images
docker tag az104container:v1 whitacr104.azurecr.io/az104container:v1
docker push whitacr104.azurecr.io/az104container:v1

FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
exporting to image
naming to docker.io/library/az104container:v1

That means your local Docker image exists now.

Next step: confirm the image

Your docker images command is already running. You should see something like:

az104container    v1
Then tag the image for ACR

Run this next:


docker tag az104container:v1 whitacr104.azurecr.io/az104container:v1

Then verify the tag:

docker images

You should see both:

az104container
whitacr104.azurecr.io/az104container


Then push to Azure Container Registry

First make sure you are logged into ACR:

az acr login --name whitacr104

Then push:

docker push whitacr104.azurecr.io/az104container:v1
After push, verify in Azure

Run:

az acr repository list --name whitacr104 --output table

You should see:

az104container

This is a big step. You solved Docker Desktop, WSL, VS Code, the Dockerfile naming issue, and the image build.

I will wait till in the morning to complete the next steps. But after this lab and just seeing the things that are involved, I feel like I cannot confidently interview as an Azure Cloud Engineer. There's just so many things that I have missed, you know, just going through this process of setting up these tools. I don't know if these tools relate more to an Azure Administrator or somebody doing DevOps, but it's been quite a bit of setup.

I understand why you feel that way, but I want to separate something clearly:

What you struggled with tonight was not “Azure Cloud Engineer failure.”
It was mostly local tooling setup:

Docker Desktop
WSL update
VS Code extensions
Azure CLI login
ACR login
Dockerfile naming
Cloud Shell vs local terminal

That is a lot, and it feels messy because it crosses Azure Admin + DevOps + developer tooling.

This container lab is more DevOps-heavy than typical Azure Admin work

For an Azure Administrator, you should understand:

ACR stores container images
ACI runs containers without managing VMs
Container Apps run scalable containerized apps
AKS is Kubernetes orchestration
Managed identity/RBAC controls access
Networking, monitoring, and cost still matter

For a DevOps Engineer, they go deeper into:

Dockerfiles
CI/CD pipelines
GitHub Actions
Build agents
Image tagging strategies
Pipeline secrets
Automated deployments

So yes — this lab touched DevOps territory.

That does not mean you are unqualified for Azure Admin work.

What this actually proves

You ran into real-world setup problems and worked through them:

Cloud Shell could not run Docker.
Docker Desktop needed WSL.
VS Code needed the right extension.
Docker needed the file named exactly Dockerfile.
Azure CLI needed authentication.
ACR needed provider registration.

That is frustrating, but it is also exactly how infrastructure work feels sometimes. The job is not always “I know everything immediately.” The job is often:

Read the error
Identify the layer
Fix the blocker
Document the lesson
Move forward

You did that.

For interviews, adjust the target title

Right now, I would not position you as a pure Azure Cloud Engineer building CI/CD container platforms.

I would position you as:

Azure Infrastructure Administrator
Cloud Infrastructure Administrator
Hybrid Cloud Systems Administrator
Azure Operations Engineer
Cloud Support / Cloud Operations Engineer
Systems Administrator with Azure experience

That matches your background much better: enterprise infrastructure, Linux/Windows, VMware, production support, incident response, storage, networking, access, monitoring, and now Azure.

What you can honestly say in an interview

You can say:

“I have been building hands-on AZ-104 labs covering Azure VMs, storage, App Service, deployment slots, ARM/Bicep, networking, and container basics. In the container lab, I worked through the difference between Cloud Shell and local Docker tooling, configured Docker Desktop and VS Code, built a Docker image, and prepared to push it to Azure Container Registry.”

That sounds honest and strong.

You are not claiming to be a senior DevOps container engineer. You are showing that you can learn, troubleshoot, and administer Azure services.

My recommendation

Finish the container lab tomorrow, but keep it bounded:

1. Tag the image
2. Login to ACR
3. Push image to ACR
4. Verify repository
5. Deploy to ACI if the lab requires it
6. Screenshot
7. Delete resource group
8. Document the lessons

Then move on. Do not spend three more days trying to master Docker.

The exam and your job search need you to be strongest in:

Identity
Storage
VMs
Networking
Monitoring
Backup
App Service
Cost control
RBAC
Troubleshooting

You are building those. Tonight felt hard because it exposed gaps in local tooling, not because you cannot do Azure administration.

I’m all ears—what’s the biggest takeaway so far?

That’s a really positive takeaway! The fact that you’ve navigated through those challenges

I’m really glad to hear that! Sometimes the process of working through these real-world challenges is what builds the most confidence—far more than just following a perfect script. Even when things aren’t laid out step-by-step, you’ve been pushing through. And now you’ve got hands-on experience with key tools that a lot of people talk about but don’t actually touch. So give yourself credit—you’re making real progress, and every mistake is just another step toward being job-ready!

Yes — with 8 hours this weekend, you can make a meaningful dent, but I would not try to build two full GPTs and also do heavy labs. That can become another rabbit hole.

My recommendation: build one serious GPT and one lightweight draft GPT.

Weekend Goal

By Sunday night, you should have:

1. Containers lab completed and pushed to GitHub
2. Networking notes started
3. One AZ-104 Study Coach GPT built
4. One Interview / Job Search GPT drafted
5. 20–30 practice questions completed

That would set you up very well for next week.

Best 8-Hour Weekend Plan
Block 1 — Finish Azure Containers Lab

2 hours

Goal:

Finish Docker tag/push
Push image to ACR
Deploy to Azure Container Instance
Take screenshots
Delete resource group

Do not let this go past 2 hours. You already solved the hard part: Docker is building the image.

Capture screenshots of:

Docker image built
ACR repository
Container Instance running
Browser output
Resource group cleanup
Block 2 — GitHub Cleanup

1 hour

Add:

containers/README.md
screenshots/containers/
Dockerfile
index.html

Commit:

git add -A
git commit -m "Add Azure Containers lab with ACR and ACI"
git push origin main

Also make sure no passwords, subscription IDs, or ACR credentials are in your files.

Block 3 — Build GPT #1: AZ-104 Study Coach

2 hours

This is the most important GPT.

Purpose:

Help you study AZ-104 using your actual labs, notes, screenshots, weak areas, and timeline.

OpenAI’s GPT builder lets you create and edit GPTs with custom instructions, knowledge files, capabilities, and testing; GPT creation/editing is available to paid users and can depend on workspace settings.

Upload as Knowledge:

Azure 104 Labs Guide.txt
App Service notes
Containers notes
Networking Word doc when ready
Git command notes
Troubleshooting notes

Do not upload files containing passwords or secrets.

Block 4 — Build GPT #2 Draft: Cloud Interview Coach

1 hour

This one does not need to be perfect yet.

Purpose:

Prepare you for Azure Infrastructure, Cloud Operations, Systems Administrator, VMware, Linux, and hybrid cloud interviews.

Use it for:

Tell me about yourself
Explain your Azure labs
Explain VMSS
Explain App Service deployment slots
Explain Docker/ACR/ACI from an admin perspective
Prepare for VMware questions
Prepare PowerShell/Azure CLI talking points

Keep this GPT private for now. Sharing options can vary by plan/workspace, and GPTs can be kept private or shared later depending on available settings.

Block 5 — Practice Questions

1 hour

Do:

10 AZ-104 questions Saturday
10 AZ-104 questions Sunday

For wrong answers, document:

Topic:
Why I missed it:
Correct rule:
Need lab review? Yes/No
Block 6 — Networking Notes Preview

1 hour

Start the Word doc sections for:

Virtual Networks
Subnets
Public IPs
NICs
NSGs
VNet Peering
DNS
Private DNS Zones

Do not try to master all networking this weekend. Just build the notes framework.

My Strong Recommendation

Build GPT #1 fully and GPT #2 lightly.

The first GPT directly supports your September 9 exam deadline. The second supports the job search, but we can improve it over time.

Priority Order
1. Finish Containers lab
2. Push to GitHub
3. Build AZ-104 Study Coach GPT
4. Draft Interview Coach GPT
5. Practice questions
6. Networking notes

This weekend should make you feel more tooled up, not more overwhelmed. The win is not doing everything perfectly — the win is creating a repeatable system for next week.

Containers almost finished

Good — that is a strong place to be.

Since Containers is almost finished, do not expand it into a deep Docker project. Close it cleanly.

Finish Containers with this checklist

Make sure you have completed:

1. Docker image built locally
2. Image tagged for Azure Container Registry
3. Image pushed to ACR
4. Repository visible in ACR
5. Container deployed to Azure Container Instance, if required
6. Container app/page verified in browser
7. Screenshots captured
8. Resource group deleted or scheduled for cleanup
9. Notes saved
10. GitHub commit pushed
Screenshots worth keeping
Docker build successful
Docker images showing az104container:v1
ACR repository showing az104container
Container Instance overview
Browser showing the running container
Resource group cleanup
GitHub commit

Once screenshots and notes are in place:

git status
git add -A
git commit -m "Add Azure Containers lab with ACR and ACI"
git push origin main
What to write in the notes

Keep it simple:

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

</>Markdown


Docker File Push

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



Finish Containers
Push Containers to GitHub
Build AZ-104 Study Coach GPT
Start the Interview Coach GPT
Do 20 practice questions total

That is enough to make a real dent without burning out.

Your next immediate steps:

1. Finish the container push/deploy steps in the morning
2. Take screenshots
3. Delete the container resource group
4. Commit to GitHub
5. Then we build the AZ-104 GPT

You’re building the right foundation: Azure skills, GitHub proof, CLI/PowerShell exposure, Docker/ACR basics, and troubleshooting discipline. That combination is going to help both the exam and interviews.
