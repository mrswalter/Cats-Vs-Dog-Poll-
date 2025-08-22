This is a project to launch a poll where people can vote betwen cats and dogs; which one is their favourite pet.

below is the structure of the entire project.

1.) Project Structure:

ecs-poll-ec2/
├── main.tf
├── variables.tf
├── modules/
│   ├── ecs-cluster/
│   │   └── cluster.tf
│   ├── ec2-launch/
│   │   └── ec2.tf
│   ├── ecs-service/
│   │   └── service.tf
│   └── load-balancer/
│       └── alb.tf


Date: 08/21/2025
Project Title: Cats vs Dogs Poll 
Author: Azwe Racheal

2.) GitHub Secrets Needed

To deploy and manage this project securely, the following GitHub secrets are required:

- `AWS_ACCESS_KEY_ID`: Your AWS access key for authentication.
- `AWS_SECRET_ACCESS_KEY`: Your AWS secret key for authentication.
- `AWS_REGION`: The AWS region where resources will be deployed.
- `DOCKERHUB_USERNAME`: DockerHub username for container image pushes.
- `DOCKERHUB_TOKEN`: DockerHub access token for authentication.

Add these secrets in your GitHub repository settings under "Settings" > "Secrets and variables" > "Actions".

3.) Workflow Behavior

On PRs → Runs terraform plan only (no infra changes).

On merge to main → Runs terraform apply automatically.

You'll get the ALB DNS name as output in the pipeline logs (you can even make it a GitHub Actions output).



4.) CI/CD PipelineThe CI/CD pipeline is defined in the `.github/workflows/terraform.yaml` file. It includes
the following steps:
- Checkout code
- Set up Terraform
- Initialize Terraform
- Validate Terraform configuration
- Plan Terraform changes
- Apply Terraform changes (only on push to main branch)
- Post Terraform output (ALB DNS name)


5.) Additional Notes
- Ensure that your AWS credentials have the necessary permissions to create and manage the resources defined in the
Terraform configuration.
- Make sure to replace any placeholder values in the Terraform files with your actual configuration details.
- Review the Terraform plan output carefully before merging changes to the main branch to avoid unintended infrastructure modifications
- Regularly update the Docker images and dependencies to maintain security and performance.
