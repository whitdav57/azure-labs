# AZ-104 Lab 02a - Manage Subscriptions and RBAC

## Objective

Implement Azure governance using Management Groups, RBAC role assignments, custom roles, and Activity Logs.

---

## Task 1 - Create Management Group

Created Management Group:

- Name: az104-mg1

### Results

Successfully created a management group to organize Azure subscriptions.

---

## Task 2 - Assign Built-In Roles

Assigned the following roles:

- Virtual Machine Contributor
- Reader

Users Assigned:

- student1
- student2
- az104-user1

### Results

Verified role assignments through Access Control (IAM).

---

## Task 3 - Create Custom Role

Created Custom Role:

**Custom Support Request**

Permissions:

- Read Authorization
- Read Resource Groups
- Create Support Requests

Excluded Permission:

- Microsoft.Support/register/action

### Results

Successfully created custom RBAC role.

---

## Task 4 - Review Activity Log

Reviewed Activity Log entries for:

- Role Assignments
- Custom Role Creation
- Resource Updates

### Results

All operations successfully recorded in Azure Activity Log.

---

## Lessons Learned

- Management Groups simplify governance.
- RBAC provides least privilege access.
- Custom roles allow granular permissions.
- Activity Logs provide auditing and monitoring.

---

## AZ-104 Exam Objectives Covered

- Management Groups
- RBAC
- Built-In Roles
- Custom Roles
- Activity Logs
- Governance