# nuke

The action assumes that nuke is a dotnet tool used in the repo that will be using the action in the workflow. During execution the action will execute `dotnet tool restore`
and then it will execute any task flagged as `true`

**Example usage**
```yaml
- id: nuke
  uses: cloud-tek/actions/nuke@v0.2
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