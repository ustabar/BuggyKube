# BuggyKube
BuggyBits application works on Kubernetes

## Docker image creation

To create a docker image run below command.
This command creates an image with name `sample`.

`docker build -t sample .`

If you want to test it, create a docker conatiner using below command.

`docker run -d -p 88:80 sample`

Open a browser and enter `http://localhost:88`.

## Test the service 

`kubectl port-forward service/buggyservice 7000:80`

## References

(Create a yaml file for a simple aspnetcore application)[https://docs.docker.com/engine/examples/dotnetcore/]
