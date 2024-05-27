# gitops-demo
A demo repository to demonstrate how to leverage GitOps with (GitHub || Azure DevOps) and (Azure Arc Enabled Kubernetes || ArgoCD)

> [!IMPORTANT]  
> Your GitHub user account must have public keys that are accessible.  For Enterprise users you may need to explicitly approve your SSH keys after joining a GitHub Enterprise Organization. Check: https://github.com/settings/keys

> [!NOTE]
> This repo does not (today) go into aspects of securing a cluster from a private networking (ingress/egress lockdown) or a full RBAC/IAM/Least Privilege Access Policy perspective

## Bootstrapping:

1a. Start a GitHub Codespace in your forked repo
1b. Clone repo to your local dev environment
2. change directory to the ```/bootstrap``` directory
3. run the terraform bootstrapping setup (NOTE to self: consider using the ```azd``` command to bootstrap infrastructure and GH Environment Secrets)

### User Admin Level

As a user with Azure Admin level access to a subscription and tenant
I want to create
- Create an Azure Resource Group to deploy the services to
- An app registration to be used in Azure to create resources scoped to a resource group


## IssueOps
- Submit an Issue
    - fill in the required parameters/fields
    - Kickstart cluster provisioning