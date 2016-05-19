#############################################

echo "Stopping Running Docker Container"
docker stop mms2016demo

#############################################
	
echo "Remove Image"

docker rm -f mms2016demo

#############################################

echo "Pull Latest Image"

sudo docker pull leeberg/thinksmalltoscalebigmms2016

#############################################

echo "Deploying Container..."

sudo docker run -d -p 80:80 -i -t --name mms2016demo leeberg/thinksmalltoscalebigmms2016

#-d for "Detached" -
#	A container in detached mode cannot be automatically removed when it stops, this means you cannot use the --rm option with -d option.

#-p  Publish a container᾿s port or a range of ports to the host
#	format: ip:hostPort:containerPort | ip::containerPort | hostPort:containerPort | containerPort

#-i  Keep STDIN open even if not attached

#-t : Allocate a pseudo-tty

#-name
	# f you specify a name, you can use it when referencing the container within a Docker network. This works for both background and foreground Docker containers.

#############################################

echo "Container Deployed"
