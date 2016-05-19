#docker search [OPTIONS] TERM
docker search busybox

#Search by Stars
docker search --stars=3 busybox

#Search docker hub
docker search microsoft

#No Truncation is helpful for discovery
docker search microsoft --no-trunc 