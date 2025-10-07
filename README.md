# my-next-app

This repository is a minimal Next.js application prepared for the DevOps assessment.
It includes Dockerfile, GitHub Actions workflow to push to GHCR, and Kubernetes manifests for Minikube.

## Quick start

Install dependencies:
```bash
npm install
npm run dev
```

Build and run locally with Docker:
```bash
docker build -t my-next-app:local .
docker run -p 3000:3000 my-next-app:local
```

Deploy to Minikube:
```bash
minikube start
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
minikube service nextjs-service --url
# or:
kubectl port-forward svc/nextjs-service 3000:3000
```

GHCR:
- Workflow file: .github/workflows/docker-publish.yml
- Image: ghcr.io/lohithdurga/my-next-app:latest

