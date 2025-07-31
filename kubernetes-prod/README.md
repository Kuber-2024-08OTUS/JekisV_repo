```shell
ubuntu@master-0:~$ kubectl get nodes -o wide
NAME       STATUS   ROLES           AGE     VERSION    INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION      CONTAINER-RUNTIME
master-0   Ready    control-plane   4m27s   v1.30.14   10.128.0.35   <none>        Ubuntu 20.04.6 LTS   5.4.0-216-generic   containerd://1.7.24
worker0    Ready    <none>          4m4s    v1.30.14   10.128.0.29   <none>        Ubuntu 20.04.6 LTS   5.4.0-216-generic   containerd://1.7.24
worker1    Ready    <none>          3m15s   v1.30.14   10.128.0.23   <none>        Ubuntu 20.04.6 LTS   5.4.0-216-generic   containerd://1.7.24
worker2    Ready    <none>          3m7s    v1.30.14   10.128.0.19   <none>        Ubuntu 20.04.6 LTS   5.4.0-216-generic   containerd://1.7.24
```
After update
```shell
ubuntu@master-0:~$ kubectl get nodes -o wide
NAME       STATUS   ROLES           AGE   VERSION    INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION      CONTAINER-RUNTIME
master-0   Ready    control-plane   21m   v1.31.11   10.128.0.35   <none>        Ubuntu 20.04.6 LTS   5.4.0-216-generic   containerd://1.7.24
worker0    Ready    <none>          21m   v1.31.11   10.128.0.29   <none>        Ubuntu 20.04.6 LTS   5.4.0-216-generic   containerd://1.7.24
worker1    Ready    <none>          20m   v1.31.11   10.128.0.23   <none>        Ubuntu 20.04.6 LTS   5.4.0-216-generic   containerd://1.7.24
worker2    Ready    <none>          20m   v1.31.11   10.128.0.19   <none>        Ubuntu 20.04.6 LTS   5.4.0-216-generic   containerd://1.7.24
```
