# nuke

The action assumes that:
- the project in the repository uses the [cloud-tek/build](https://github.com/cloud-tek/build) to build the project modules & artifacts within
- nuke is a dotnet tool used in the repo that will be using the action in the workflow. 

During execution the action will execute `dotnet tool restore`
and then it will execute any task flagged as `true`

**Example usage**
```yaml
jobs:
  build:
    uses: cloud-tek/actions/nuke@tag
    name: nuke
    with:
      Directory: ${{ github.workspace }}
      NetCoreVersion: 6.0.100
      Compile:      bool
      UnitTests:    bool
      Pack:         bool
      Push:         bool
      ModuleTests:  bool
      SystemTests:  bool
      SmokeTests:   bool
      NuGetApiUrl:  'https://nuget.pkg.github.com/cloud-tek/index.json'
    secrets:
      NuGetApiKey:  '${{ secrets.GH_PAT }}'
```