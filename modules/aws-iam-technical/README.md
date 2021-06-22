AWS IAM role for adding technical users like `CI`s (for pushing Docker images into EKS) or automation/provisioners like 
Terraform. The role creates users and groups provided as input, as well as user assignments to the groups and group 
policy attachments.

Role generates AWS access keys and stores them in the `ouput` folder.
