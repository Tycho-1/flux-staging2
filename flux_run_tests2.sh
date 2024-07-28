flux create source git staging \
    --url https://github.com/$GITHUB_ORG/flux-staging2 \
    --branch master \
    --interval 30s \
    --export \
    | tee apps/staging.yaml

flux create kustomization staging \
    --source staging \
    --path "./" \
    --prune true \
    --validation client \
    --interval 10m \
    --export \
    | tee -a apps/staging.yaml

flux create source git \
    devops-toolkit \
    --url https://github.com/$GITHUB_ORG/devops-toolkit \
    --branch master \
    --interval 30s \
    --export \
    | tee apps/devops-toolkit.yaml
