![test workflow](https://github.com/cuzfrog/setup-kubectl/actions/workflows/test-action.yml/badge.svg)
# Setup kubectl in Github Actions

This action provides `kubectl` for GitHub Actions.

## Usage
```yaml
- name: deploy to cluster
  uses: cuzfrog/setup-kubectl@v1
  with: # defaults to latest kubectl binary version
    config: ${{ secrets.KUBE_CONFIG_DATA }}
    version: v1.21.6
    run: |
      kubectl apply -f my-app.deployment.yml
      kubectl rollout status deployment/my-app
```

## Arguments
`run` – **required**: The script you want to run, e.g. `kubectl get pods`.

`config` – **required**: A base64-encoded kubeconfig file with credentials for Kubernetes to access the cluster. You can get it by running the following command:

```bash
cat kube.config | base64
```

`version`: The kubectl version with a 'v' prefix, e.g. `v1.21.0`. It defaults to the latest kubectl binary version available.

## Author
Cause Chung <cuzfrog@gmail.com>
