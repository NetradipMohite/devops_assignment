# Kubernetes Horizontal Pod Autoscaler (HPA)

This folder contains a HorizontalPodAutoscaler definition for the Node.js application.

---

## File

- `hpa.yaml`: HPA config to autoscale based on CPU usage

---

## What It Does

- Targets a Deployment named `node-app`
- Scales up to 5 pods if CPU > 50%
- Ensures minimum 2 pods are always running

---

## How to Apply

```bash
kubectl apply -f hpa.yaml
