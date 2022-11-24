# FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
# COPY DotNetCore/ App/
# WORKDIR /App
# ENTRYPOINT ["dotnet", "BuggyForCore.dll"]

FROM mcr.microsoft.com/dotnet/sdk:3.1

RUN dotnet tool install --tool-path /tools dotnet-counters
# RUN dotnet tool install --tool-path /tools dotnet-coverage
RUN dotnet tool install --tool-path /tools dotnet-dump
RUN dotnet tool install --tool-path /tools dotnet-gcdump
RUN dotnet tool install --tool-path /tools dotnet-trace
# RUN dotnet tool install --tool-path /tools dotnet-stack
RUN dotnet tool install --tool-path /tools dotnet-symbol
RUN dotnet tool install --tool-path /tools dotnet-sos

ENV ASPNETCORE_URLS=http://+:80
ENV COMPlus_DbgEnableMiniDump="1"
ENV COMPlus_DbgMiniDumpName="/dumps/coredump.1.2"
ENV COMPlus_DbgMiniDumpType="4"

EXPOSE 80

COPY DotNetCore/ App/
WORKDIR /App
ENTRYPOINT ["dotnet", "BuggyForCore.dll"]
