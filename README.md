# Litecoin Terraform

Terraform infrastructure for the [Litecoin container project](https://github.com/davidlukac/litecoin-container).


## Usage

All Terraform operations should be done inside the [Terraform container](https://github.com/davidlukac/litecoin-tf-container)
to ensure Terraform version stability:
```shell
# Start up the container:
bin/docker-run.sh

# Select workspace
tf workspace select litecoin

# Initialize modules and providers
tf init environments/litecoin

# Apply changes
tf apply environments/litecoin
```


### State management

For now the state is local, normally the state would be placed to some remote backend (e.g. AWS S3 + DynamoDB).


### Prerequisites

- Terraform expects AWS credentials, and some other data provided, e.g., in `secret.auto.tfvars`:
  ```
  AWS_ACCESS_KEY = 
  AWS_SECRET_KEY = 
  AWS_ACCOUNT_ID = 
  LITECOIN_DATA_ROOT= <host path for PV data>
  ```
- `k8s-resources` module assumes local Docker desktop Kubernetes cluster.
- `k8s-resources` module expects `litecoin.conf` file with credentials in `resources/secret/` folder. 


## Modules

- `aws-ecr` creates ECR repositories,
- `aws-eks` stub module for EKS cluster provisioning,
- `aws-iam-default` creates related IAM entities (role, group, policy, user) in a unified fashion,
- `aws-iam-technical` creates technical IAM accounts (`ci` for ECR push and `terraform` for provisioning) with access 
  keys as output for further usage,
- `k8s-resource` provisions necessary resources (NS, PV, secret) for the `litecoin` container deployment.  
