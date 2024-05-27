# Bootstrapping GitHub to Azure Federated credentials with Terraform

Copied from https://github.com/DevExpGbb/github-azure-workload-identity.

Optional:
- Run in GH codespaces

Required:
- Authenticate to Azure CLI as your Azure Admin (must have AAD/Entra Admin and Subscription Administrator Roles)
- Authenticate to GitHub as Admin user (Must be able to create secrets on Repo/Actions)
    - If you are using GH Codespaces you will need to ```unset GITHUB_TOKEN``` then run another ```gh auth login``` as the default PAT token injected by Codespaces does not have the sufficient permissions (Token scope does not include Repo:Environment:Secrets at all - confirmed)

Notes:
- Artifacts created (e.g. terraform state) do not/should not need to be persisted (only used to create SPN, Create Federation and store App/Client and Tenant ID as a Action Environment Secrets to be consumed by specified Action)

## Terraform/scripting high level flow

Note that the above Requirements around User role assignments must be met (Admin on AAD/Entra, Azure and GitHub)

1. Create Azure Resource Group
    - As an Azure Subscription Administrator (must be able to create Azure resources **AND** create Role Assignments to resources)
2. Create an App Registration, Service Principal
    - App Registration needs Required Resource (API) Permissions
        - Usually User.Read.All on MSFT Graph is sufficient to get JWT token (see ```azuread_service_principal-workload-identity-setup.tf``` for implementation details)
    - Create a ```Federated Identity Credential``` - this does the OIDC trusted joining between Azure & GitHub
        - Requires input on the GitHub Org, Repo Name and the type of "Entity" that is making the call for token (Entity being one of GitHub [Environment, Pull Request, Tag, Branch]) as the Entiy type calling is passed in the OIDC exchange/handshake to scope the request down securely and properly
3. Assign Role/Permissions to Azure Resources
    - In this example we are assigning "```Contributor```" role access to the Demo Resource Group we are creating
    - Provides a narrow (Least Privilege) access to the correct sope that we need here (Resource Group CRUD only and can not add/assign other identities to this group)
4. Create GitHub Environment
    - Currently the Demo is only designed to work with GitHub Actions in specified Environments
5. Store the Azure App/Client ID, AAD/Entra Tenant ID and Azure Subscription ID as Environment Secrets
    - Used later in Actions to auth to Azure/AAD/Entra and exchange for a Workload Identity/Service Principal JWT to log into Azure CLI/Make Azure Resource Manager (ARM) requests