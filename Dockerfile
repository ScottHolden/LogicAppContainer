FROM mcr.microsoft.com/dotnet/sdk:3.1 AS builder

WORKDIR /app
COPY *.csproj ./
RUN dotnet restore
COPY ./ ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/azure-functions/dotnet:3.12.1-appservice

# Fill in the AzureWebJobsStorage value!
ENV AzureWebJobsStorage=""
ENV AZURE_FUNCTIONS_ENVIRONMENT Development
ENV AzureWebJobsScriptRoot=/home/site/wwwroot
ENV AzureFunctionsJobHost__Logging__Console__IsEnabled=true
ENV FUNCTIONS_V2_COMPATIBILITY_MODE=true

COPY --from=builder /app/out /home/site/wwwroot