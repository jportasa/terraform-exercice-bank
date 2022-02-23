## Scalability

I have fill only the staging folder with all TF files required. Note the now, you only need changing the vars.tf file for each service (account, payment, gateway) and for each environment, rest of the files remain the same.

I have added as well a folder for each AWS region. To can deploy the services to different ones.

I have added a Vault module because the code is repeated.

The advantage of using many TF plans is that we reduce the chance that 2 developers are working in the same plan and therraform blocks one of them.

## Terraform Modules placement

Better practice is to put modules in different repo to can create releases, in the test I have added the modules folder in same repo to simplify tough.

## Security issues

If you define secrets in a repo, without being encrypted it can be compromised, as easy as some engineer looses his/her repo token.

If you put secrets in the same repo, developers will cannot contribute to terraform repo unless you want all of them to know the vault secrets for any app.

## CICD pipeline

The pipeline can run over Atlantis (https://www.runatlantis.io/). Atlantis can run over a EC2, ECS, k8s,... and will be triggered by a webhook from GitHub/Gitlab/... pipeline

We can add tests in the pipeline like tfsec, FMT,..or many others.