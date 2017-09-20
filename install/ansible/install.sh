ansible-playbook -i hosts -u docker cri-containerd.yaml
sudo systemctl stop kubelet
sudo systemctl stop cri-containerd
sudo systemctl stop containerd
cp /home/docker/cri-containerd /usr/local/bin/
sudo systemctl start containerd
sudo systemctl start cri-containerd
sudo systemctl start kubelet
kubeadm init --apiserver-advertise-address 172.31.7.85 --skip-preflight-checks
