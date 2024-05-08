# login to azure 
az login

az account set --subscription "06822c82-3851-4ffa-8410-f4a224b92590"

$RESOURCE_GROUP="pluralsight"
$DB_ACCOUNT_NAME="pluralsightdb"
$DB_NAME="sampledb"
$CONTAINER_NAME="samplecontainer"

# create resource-group
az group create --name $RESOURCE_GROUP --location eastus

# create a sql api cosmos db account 
az cosmosdb create --name $DB_ACCOUNT_NAME --resource-group $RESOURCE_GROUP

# create a sql database
az cosmosdb sql database create --account-name $DB_ACCOUNT_NAME --name $DB_NAME --resource-group $RESOURCE_GROUP

# create a sql database container
az cosmosdb sql container create --account-name $DB_ACCOUNT_NAME `
                                 --database-name $DB_NAME `
                                 --name MyContainer `
                                 --partition-key-path "/employeeid" `
                                 --resource-group $RESOURCE_GROUP `
                                 --throughput "700"
