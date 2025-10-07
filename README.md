
# DevOps Assessment - Next.js Docker & Kubernetes Deployment

## Candidate: Lohith Durga

## Overview

This project demonstrates the complete lifecycle of a Next.js application deployed using **Docker** and **Kubernetes**. The project includes:

1. Local development and testing of a Next.js app.
2. Containerization of the app using Docker.
3. Deployment to a single-node Kubernetes cluster (Minikube) for testing.
4. CI/CD workflow setup using GitHub Actions (builds and automates the Docker image).

> **Note:** Container registries (GHCR, Docker Hub, etc.) are optional and not used in this submission. The focus is on building, running, and deploying the application.

---

## Project Structure

```
my-next-app/
├── Dockerfile
├── .dockerignore
├── .github/
│   └── workflows/
│       └── docker-publish.yml
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
├── pages/
│   └── index.js
├── public/
│   └── README.txt
├── package.json
└── README.md
```

---

## Features Implemented

1. **Next.js Application**

   * Simple web app displaying:
     `"Hello from Lohith Durga - DevOps Internship App"`
   * Provides a clear demonstration of React-based SSR (Server Side Rendering).

2. **Docker Containerization**

   * Multi-stage Dockerfile to build and run the application efficiently.
   * Ensures consistent environments across machines.
   * `.dockerignore` file to reduce image size and speed up builds.

3. **GitHub Actions Workflow**

   * Automates building Docker images (if needed) when code is pushed to `main`.
   * Ensures CI/CD pipeline practices are demonstrated.

4. **Kubernetes Deployment**

   * Deployment manifest with 2 replicas for redundancy.
   * Service manifest to expose the app via NodePort.
   * Liveness and readiness probes to ensure Kubernetes health checks.

5. **Local Testing**

   * The application can be tested locally using `npm run dev` or Docker commands.
   * Kubernetes deployment tested via Minikube on the instance.

---

## Step-by-Step Execution

### 1. Local Development

```bash
git clone https://github.com/lohithdurga/my-next-app.git
cd my-next-app
npm ci
npm run dev
```

* Open browser at `http://localhost:3000`
* Verify the app displays: `"Hello from Lohith Durga - DevOps Internship App"`

### 2. Build & Run Docker Container

```bash
docker build -t my-next-app:local .
docker run --rm -p 3000:3000 my-next-app:local
```

* Test locally at `http://localhost:3000`

### 3. Deploy to Kubernetes (Minikube)

```bash
minikube start --driver=docker
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl get pods -w
minikube service nextjs-service --url
```

* Access the URL printed by Minikube to see the app running in Kubernetes.
* 2 replicas ensure high availability.

---

## Key Concepts Demonstrated

* **Containerization:** Running apps in isolated environments.
* **Kubernetes Deployment:** Managing multiple instances of the app, health checks, and service exposure.
* **CI/CD Principles:** Automating builds and testing via GitHub Actions.
* **Best Practices:** Multi-stage Dockerfile, `.dockerignore`, replica management, liveness/readiness probes.

---

## Notes for Interviewer

1. All steps were executed on a **Red Hat 9 instance**.
2. Docker and Kubernetes were used **locally** via Minikube; no external registry was required.
3. Commands in this README are copy-paste ready for verification.
4. The project demonstrates understanding of **DevOps workflows**, containerization, and deployment best practices.

---

## Contact

**Candidate:** Lohith Durga
**GitHub Repository:** [https://github.com/lohithdurga/my-next-app](https://github.com/lohithdurga/my-next-app)
**Email:** [Your email here]

---
