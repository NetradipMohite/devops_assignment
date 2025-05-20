# Jenkins CI/CD Pipeline

This folder contains a Jenkinsfile to automate CI/CD for the Node.js API.

---

## Steps Performed

1. **Clone Git Repository**  
   Pulls source code from GitHub.

2. **Install Dependencies**  
   Runs `npm install` inside the `docker_setup/nodejs_app/` directory.

3. **Run Tests**  
   Runs `npm test`. If no tests exist, it logs and skips.

4. **Build Docker Image**  
   Builds a Docker image from the Node.js app using its Dockerfile.

5. **(Mock) Push to Docker Hub**  
   Echoes the image name that would be pushed. This step is mocked.

---

## Setup Notes

- Replace the Git repo URL in the Jenkinsfile with your actual one.
- You must run Jenkins on an agent with:
  - Git
  - Node.js
  - Docker
- You can uncomment the `docker push` command to actually push the image.

---

## Image Tag

```bash
your-dockerhub-username/node-api:latest
