$processes = if ($env:PARALLEL_PROCESSES) { $env:PARALLEL_PROCESSES } else { "2" }
$scope = if ($env:EXECUTION_SCOPE) { $env:EXECUTION_SCOPE } else { "framework" }
$output = if ($env:PARALLEL_OUTPUT_DIR) { $env:PARALLEL_OUTPUT_DIR } else { "reports/parallel" }

Write-Host "Running Robot Framework in parallel"
Write-Host "Processes: $processes"
Write-Host "Scope: $scope"
Write-Host "Output: $output"

if ($scope -eq "framework") {
    pabot --processes $processes --outputdir $output tests/framework
}
elseif ($scope -eq "smoke") {
    pabot --processes $processes --outputdir $output --include smoke tests
}
else {
    pabot --processes $processes --outputdir $output tests
}

exit $LASTEXITCODE
