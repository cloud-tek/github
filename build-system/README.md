# build-system

The action assumes that:
- the project in the repository uses the [cloud-tek/build-system](https://github.com/cloud-tek/build-system) to build the project modules & artifacts within
- nuke is a dotnet tool used in the repo that will be using the action in the workflow. 
During execution the action will execute `dotnet tool restore`
and then it will execute any task flagged as `true`

**Example usage**
```yaml
- id: nuke
  uses: cloud-tek/actions/build-system@v0.2
  name: nuke
  with:
    directory: ${{ github.workspace }}
    Compile:            'true | false'
    UnitTests:          'true | false'
    IntegrationTests:   'true | false'
    ModuleTests:        'true | false'
    SystemTests:        'true | false'
    SmokeTests:         'true | false'
```