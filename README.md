# BuggyKube
BuggyBits application works on Kubernetes

## Docker image creation

To create a docker image run below command.
This command creates an image with name `sample`.
```bash
docker build -t sample .

REPOSITORY    TAG        IMAGE ID       CREATED         SIZE
sample        latest     651db47f3817   2 hours ago     212MB
```
If you want to test it, create a docker conatiner using below command.
```bash
docker run -d -p 88:80 sample

docker ps

CONTAINER ID   IMAGE                  COMMAND                  CREATED             STATUS             PORTS                    NAMES
9af8b8f78897   sample                 "dotnet BuggyForCore…"   11 seconds ago      Up 9 seconds       0.0.0.0:88->80/tcp       amazing_bar
```
Open a browser and enter `http://localhost:88`.

## Deploy application onto Kubernetes

Use `sample` image and deploy it to a Kubernetes Cluster
```bash
kubectl apply -f buggy-deploy.yaml
```

This command will create a deployment and a service.
You can check the result using:
```bash
kubectl get pods,deployment,servcice -n default

NAME                            READY   STATUS    RESTARTS   AGE
pod/buggy-6b465d7854-n82lb      1/1     Running   1          100m

NAME                            READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/buggy           1/1     1            1           100m

NAME                            TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/buggyservice            ClusterIP      10.98.10.73      <none>        80/TCP           100m
```
## Test the service 
```bash
kubectl port-forward service/buggyservice 70:80
```
## References

- [Create a yaml file for a simple aspnetcore application](https://docs.docker.com/engine/examples/dotnetcore/)

- [Running ASP.NET Applications (Core) in Kubernetes — A Detailed Step By Step Approach](https://bterkaly.medium.com/running-asp-net-applications-in-kubernetes-a-detailed-step-by-step-approach-96c98f273d1a)

- [Deploy ASP.NET Core apps to Azure Kubernetes Service with Azure DevOps Starter](https://docs.microsoft.com/en-us/azure/devops-project/azure-devops-project-aks)

- [Build ASP.NET Core applications deployed as Linux containers into an AKS/Kubernetes orchestrator](https://docs.microsoft.com/en-us/dotnet/architecture/containerized-lifecycle/design-develop-containerized-apps/build-aspnet-core-applications-linux-containers-aks-kubernetes)

- [Generate tables in markdown](https://www.tablesgenerator.com/markdown_tables)
