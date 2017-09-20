kill -9 $(ps -aux | grep containerd-shim | awk '{ print $2 }')
kill -9 $(ps -aux | grep kube- | awk '{ print $2 }')
find /var/lib/containerd | xargs sudo umount
find /var/lib/cri-containerd | xargs sudo umount
find /var/run/containerd | xargs sudo umount
rm -rf /var/lib/containerd
rm -rf /var/lib/cri-containerd 
rm -rf /var/run/containerd
rm -rf /var/libnetwork/etcd/*
