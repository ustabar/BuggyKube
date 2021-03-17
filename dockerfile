FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
COPY DotNetCore/ App/
WORKDIR /App
ENTRYPOINT ["dotnet", "BuggyForCore.dll"]

# docker build -t sample .
# docker run -d -p 88:80 sample
#
# https://docs.docker.com/engine/examples/dotnetcore/
#
# kubectl port-forward service/buggyservice 7000:80