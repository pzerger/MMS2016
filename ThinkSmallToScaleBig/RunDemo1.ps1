#Best "no bs" getting started blog:
#https://blogs.msdn.microsoft.com/jcorioland/2016/04/28/getting-started-with-containers-and-docker-on-windows-server-2016-technical-preview-5/

docker pull microsoft/iis:latest

docker network inspect nat

docker run -itd -p 8080:80 microsoft/iis cmd 

docker ps

docker stop name