# build-system

This action will automatically generate tags, when a pull request from `release/{major}.{minor}` or `hotfix/*` is merged to `main`

**Example usage**
```yaml
- id: auto-tag
  uses: cloud-tek/actions/auto-tag@v0.7
  name: auto-tag
  with:
    branch: main
```