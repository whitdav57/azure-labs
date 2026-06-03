## Check repository status
Shows changed or new files

```bash
git status
```

---

## Add all changed files
Stages files for commit

```bash
git add .
```

---

## Commit changes
Creates a save point

```bash
git commit -m "Added Azure networking notes"
```

---

## Push changes to GitHub
Uploads commits to GitHub

```bash
git push
```

---

## Pull latest changes from GitHub

```bash
git pull
```

---

## View commit history

```bash
git log
```

---

# Basic Git Workflow

```bash
git status
git add .
git commit -m "Describe changes"
git push
```

---

# Azure Repo Example

```bash
git status
git add .
git commit -m "Added NSG lab notes"
git push
```

---

# Common Git Terms

## Repository (Repo)
Project folder tracked by Git

## Commit
Saved snapshot of changes

## Push
Upload local changes to GitHub

## Pull
Download latest changes from GitHub

## Branch
Separate version of work

## Clone
Download repo from GitHub to local PC

git add .
git commit -m "Added Git command cheat sheet"
git push

HOW TO TAKE SCREENSHOTS (Windows)
Easy Method

Press:

Windows + Shift + S

Then:

Drag area
Save image

Recommended Upgrade

Download latest 64-bit PowerShell:

PowerShell Download Page

Choose:

PowerShell-7.x.x-win-x64.msi

Install it.

Then reopen PowerShell and rerun:

Install-Module Az -Force
🔥 AZ-104 Pro Tip

After installation, these commands should work:

Get-AzAccount
Get-AzSubscription
Get-AzVM
Get-AzResourceGroup

These are core AZ-104 commands.