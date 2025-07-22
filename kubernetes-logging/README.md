вывод `kubectl get node -o wide --show-labels`  
```shell
cloudshell-user:~$ kubectl get node -o wide --show-labels                                                                                                                                                
NAME                        STATUS   ROLES    AGE     VERSION   INTERNAL-IP   EXTERNAL-IP      OS-IMAGE             KERNEL-VERSION      CONTAINER-RUNTIME     LABELS                                     
cl1iepd1q677kgek7ji5-anih   Ready    <none>   9m35s   v1.29.1   10.128.0.26   130.193.38.156   Ubuntu 20.04.6 LTS   5.4.0-216-generic   containerd://1.7.25   beta.kubernetes.io/arch=amd64,beta.kubernet
es.io/instance-type=standard-v3,beta.kubernetes.io/os=linux,failure-domain.beta.kubernetes.io/zone=ru-central1-a,kubernetes.io/arch=amd64,kubernetes.io/hostname=cl1iepd1q677kgek7ji5-anih,kubernetes.io/
os=linux,node.kubernetes.io/instance-type=standard-v3,node.kubernetes.io/kube-proxy-ds-ready=true,node.kubernetes.io/masq-agent-ds-ready=true,node.kubernetes.io/node-problem-detector-ds-ready=true,topo
logy.kubernetes.io/zone=ru-central1-a,yandex.cloud/node-group-id=catjhkbikml8ijvi4pg4,yandex.cloud/pci-topology=k8s,yandex.cloud/preemptible=false                                                       
cl1lrj6eg7oesbksj1pv-ywid   Ready    <none>   9m2s    v1.29.1   10.128.0.20   51.250.72.243    Ubuntu 20.04.6 LTS   5.4.0-216-generic   containerd://1.7.25   beta.kubernetes.io/arch=amd64,beta.kubernet
es.io/instance-type=standard-v3,beta.kubernetes.io/os=linux,failure-domain.beta.kubernetes.io/zone=ru-central1-a,kubernetes.io/arch=amd64,kubernetes.io/hostname=cl1lrj6eg7oesbksj1pv-ywid,kubernetes.io/
os=linux,node.kubernetes.io/instance-type=standard-v3,node.kubernetes.io/kube-proxy-ds-ready=true,node.kubernetes.io/masq-agent-ds-ready=true,node.kubernetes.io/node-problem-detector-ds-ready=true,topo
logy.kubernetes.io/zone=ru-central1-a,yandex.cloud/node-group-id=catn33lcvvi21vpajugo,yandex.cloud/pci-topology=k8s,yandex.cloud/preemptible=false
```
вывод `kubectl get nodes -o custom-columns=NAME:.metadata.name,TAINTS:.spec.taints`  
```shell
kubectl get nodes -o custom-columns=NAME:.metadata.name,TAINTS:.spec.taints                                                                                                           
NAME                        TAINTS                                                                                                                                                                       
cl1iepd1q677kgek7ji5-anih   [map[effect:NoSchedule key:node-role value:infra]]                                                                                                                           
cl1lrj6eg7oesbksj1pv-ywid   <none> 
```  
---

