# Variables
$resourceGroupName = "RG01"
$appServicePlanName = "ASP-RG01-bb32"
$location = "West Europe"
$webAppName = "sysweb04"
# Check if the App Service Plan exists
$appServicePlan = Get-AzAppServicePlan -ResourceGroupName $resourceGroupName -Name $appServicePlanName -ErrorAction SilentlyContinue
# If the App Service Plan does not exist, create it with Free tier
if (-not $appServicePlan) {
    $appServicePlan = New-AzAppServicePlan -ResourceGroupName $resourceGroupName -Location $location -Name $appServicePlanName -SkuTier "Free"
}
# Create a new Web App
New-AzWebApp -ResourceGroupName $resourceGroupName -Name $webAppName -Location $location -AppServicePlan $appServicePlanName