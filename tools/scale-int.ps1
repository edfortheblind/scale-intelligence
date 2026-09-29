param(
    [Parameter(Mandatory=$true)]
    [ValidateSet('preflight','discover','capture','resume','verify','status','publish')]
    [string]$Operation,
    [string]$Bundle,
    [string]$References
)
$ErrorActionPreference = 'Stop'
$collectorArgs = @((Join-Path $PSScriptRoot 'collector.py'), $Operation)
if ($Bundle) { $collectorArgs += @('--bundle', $Bundle) }
if ($References) { $collectorArgs += @('--references', $References) }
& python @collectorArgs
exit $LASTEXITCODE
