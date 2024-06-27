# copies your local ssh to the container

# assumes your local ssh is: ~/.ssh
# assumes the container ssh is: /root/.ssh

node_tag="22.1-bullseye"
ssh_file="id_rsa_personal"

containerid=$(docker run -d -t node:$node_tag)
docker container cp ~/.ssh/$ssh_file $containerid:/root/.ssh/id_rsa
docker exec $containerid mkdir /root/work