# copies your local ssh to the container

# assumes your local ssh is: ~/.ssh
# assumes the container ssh is: /root/.ssh

node_tag="22.1-bullseye"
ssh_file="id_rsa_personal"

containerid=$(docker run -d -t node:$node_tag)
docker exec $containerid mkdir -p /root/.ssh
docker container cp ~/.ssh/$ssh_file $containerid:/root/.ssh/id_rsa
docker exec $containerid mkdir -p /root/work
docker exec $containerid git config --global user.email "kiohhan.dev@gmail.com"
docker exec $containerid git config --global user.name "Kioh"