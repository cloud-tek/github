# build-system

This action will automatically install ContainerD `crictl` 

**Example usage**
```yaml
- id: install-containerd
  uses: cloud-tek/actions/install-containerd@v0.7
  name: install-containerd
  with:
    version: v1.22.0
    os: linux
    architecture: amd64
```