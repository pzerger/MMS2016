#Best "no bs" getting started blog:
#https://blogs.msdn.microsoft.com/jcorioland/2016/04/28/getting-started-with-containers-and-docker-on-windows-server-2016-technical-preview-5/

#Windows Core Docker
docker run -it windowsservercore cmd

#Pull IIS
docker pull microsoft/iis:latest

#Run!
docker run -itd -p 8080:80 microsoft/iis cmd 

#Inspect
docker network inspect nat


docker ps

docker stop name