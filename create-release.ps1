param (
    [string]$version
)

Set-ExecutionPolicy RemoteSigned -Scope Process
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'


function Main {
    param (
        [Parameter(Mandatory)]
        [string]$version
    )

    hub commit -am $version
    hub release create -a .\README.md -m $version $version
    hub push --follow-tags
    hub pull
}

Main $version