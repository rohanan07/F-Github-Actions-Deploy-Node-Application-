Automated CI/CD Deployment with GitHub Actions
A fully automated "push-to-prod" pipeline for a Node.js application. Every change pushed to the main branch is automatically containerized, pushed to Amazon ECR, and deployed to an AWS EC2 instance via Docker Compose.

🏗️ Architecture
![Architecture Diagram](./https://github.com/rohanan07/F-Github-Actions-Deploy-Node-Application-/blob/main/Screenshot%202026-02-16%20220653.png)

🚀 The Pipeline Flow
The CI/CD process is split into two distinct jobs:

1. Continuous Integration (CI) - Job 1
Build: Creates a Docker image from the Node.js source code.

Registry: Authenticates with AWS and pushes the image to Amazon ECR.

2. Continuous Deployment (CD) - Job 2
SSH Connection: Securely connects to the Ubuntu EC2 instance using GitHub Secrets.

Orchestration: Runs docker compose pull to fetch the latest image and docker compose up -d to restart the service with zero manual intervention.

🛠️ Tech Stack
Language: Node.js

Containerization: Docker & Docker Compose

CI/CD: GitHub Actions

Cloud: AWS (EC2, ECR)

🧠 Key Learnings & Troubleshooting
Implementing this pipeline for the first time taught me how to handle real-world deployment blockers:

SSH Formatting: Solved ssh.ParsePrivateKey errors by ensuring proper PEM format (headers/footers and trailing newlines) in GitHub Secrets.

Deployment Logic: Fixed a bug where the server tried to build the image locally instead of pulling it from ECR by optimizing the docker-compose.yml file.

Permissions: Configured IAM roles and AWS CLI on the EC2 instance to allow seamless ECR authentication.

📖 How to Run
Clone the repository.

Set up your AWS ECR and EC2 instance.

Configure the following GitHub Secrets:

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

EC2_HOST

EC2_SSH_KEY

Push a change to the main branch and watch the magic happen! 🚀
