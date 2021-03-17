FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
COPY DotNetCore/ App/
WORKDIR /App
ENTRYPOINT ["dotnet", "BuggyForCore.dll"]
