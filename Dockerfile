FROM docker.repo.ihsmarkit.com/dotnet/sdk:6.0 AS build-env
WORKDIR /src
COPY [".nuget/NuGet.Config", "./"]
COPY . .
RUN ls /src
#####################################
###### BUILD ADMIN FRONTEND ######
#####################################
###############################
###### TESTS AND PUBLISH ######
###############################
FROM build-env as publish

RUN ls /src
RUN dotnet publish "TestDockerBuildkit/TestDockerBuildkit.csproj" -c Release -o /publish/TestDockerBuildkit
RUN dotnet publish "TestDockerBuildkit2/TestDockerBuildkit2.csproj" -c Release -o /publish/TestDockerBuildkit2