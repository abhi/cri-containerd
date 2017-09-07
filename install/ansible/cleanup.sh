find /var/lib/containerd | xargs sudo umount
find /var/lib/cri-containerd | xargs sudo umount
find /var/run/containerd | xargs sudo umount
rm -rf /var/lib/cri-containerd
rm -rf /var/lib/containerd 
rm -rf /var/run/containerd
