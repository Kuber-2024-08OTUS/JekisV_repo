```shell
[jekis_@fedora-hp kubernetes-debug]$ kubectl debug -n default nginx-distroless -it --image=busybox --target=nginx-distroless --share-processes -- sh
Targeting container "nginx-distroless". If you don't see processes from this container it may be because the container runtime doesn't support this feature.
Defaulting debug container name to debugger-w6xdc.
If you don't see a command prompt, try pressing enter.
/ # ls -la /etc/
group          hostname       hosts          localtime      network/       nsswitch.conf  passwd         resolv.conf    shadow
/ # ls -la /proc/1/root/etc/nginx/
total 48
drwxr-xr-x    3 root     root          4096 Oct  5  2020 .
drwxr-xr-x    1 root     root          4096 Jul 29 17:44 ..
drwxr-xr-x    2 root     root          4096 Oct  5  2020 conf.d
-rw-r--r--    1 root     root          1007 Apr 21  2020 fastcgi_params
-rw-r--r--    1 root     root          2837 Apr 21  2020 koi-utf
-rw-r--r--    1 root     root          2223 Apr 21  2020 koi-win
-rw-r--r--    1 root     root          5231 Apr 21  2020 mime.types
lrwxrwxrwx    1 root     root            22 Apr 21  2020 modules -> /usr/lib/nginx/modules
-rw-r--r--    1 root     root           643 Apr 21  2020 nginx.conf
-rw-r--r--    1 root     root           636 Apr 21  2020 scgi_params
-rw-r--r--    1 root     root           664 Apr 21  2020 uwsgi_params
-rw-r--r--    1 root     root          3610 Apr 21  2020 win-utf
```
```shell
[jekis_@fedora-hp kubernetes-debug]$ kubectl debug -n default nginx-distroless -it --image=corfr/tcpdump --target=nginx-distroless --share-processes -- sh
Targeting container "nginx-distroless". If you don't see processes from this container it may be because the container runtime doesn't support this feature.
Defaulting debug container name to debugger-ddz8n.
If you don't see a command prompt, try pressing enter.
/ # tcpdump -nn -i any -e port 80
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
17:53:58.006104  In ee:ee:ee:ee:ee:ee ethertype IPv4 (0x0800), length 76: 10.112.129.21.43236 > 10.112.129.20.80: Flags [S], seq 1958605685, win 64240, options [mss 1460,sackOK,TS val 3745194279 ecr 0,nop,wscale 7], length 0
17:53:58.006130 Out da:fa:f6:29:ab:8c ethertype IPv4 (0x0800), length 76: 10.112.129.20.80 > 10.112.129.21.43236: Flags [S.], seq 3423695349, ack 1958605686, win 65160, options [mss 1460,sackOK,TS val 1963463486 ecr 3745194279,nop,wscale 7], length 0
17:53:58.006158  In ee:ee:ee:ee:ee:ee ethertype IPv4 (0x0800), length 68: 10.112.129.21.43236 > 10.112.129.20.80: Flags [.], ack 1, win 502, options [nop,nop,TS val 3745194279 ecr 1963463486], length 0
17:53:58.006242  In ee:ee:ee:ee:ee:ee ethertype IPv4 (0x0800), length 137: 10.112.129.21.43236 > 10.112.129.20.80: Flags [P.], seq 1:70, ack 1, win 502, options [nop,nop,TS val 3745194279 ecr 1963463486], length 69: HTTP: GET / HTTP/1.1
17:53:58.006246 Out da:fa:f6:29:ab:8c ethertype IPv4 (0x0800), length 68: 10.112.129.20.80 > 10.112.129.21.43236: Flags [.], ack 70, win 509, options [nop,nop,TS val 1963463486 ecr 3745194279], length 0
17:53:58.006453 Out da:fa:f6:29:ab:8c ethertype IPv4 (0x0800), length 306: 10.112.129.20.80 > 10.112.129.21.43236: Flags [P.], seq 1:239, ack 70, win 509, options [nop,nop,TS val 1963463486 ecr 3745194279], length 238: HTTP: HTTP/1.1 200 OK
17:53:58.006520 Out da:fa:f6:29:ab:8c ethertype IPv4 (0x0800), length 680: 10.112.129.20.80 > 10.112.129.21.43236: Flags [P.], seq 239:851, ack 70, win 509, options [nop,nop,TS val 1963463486 ecr 3745194279], length 612: HTTP
17:53:58.006572  In ee:ee:ee:ee:ee:ee ethertype IPv4 (0x0800), length 68: 10.112.129.21.43236 > 10.112.129.20.80: Flags [.], ack 851, win 496, options [nop,nop,TS val 3745194279 ecr 1963463486], length 0
17:53:58.006900  In ee:ee:ee:ee:ee:ee ethertype IPv4 (0x0800), length 68: 10.112.129.21.43236 > 10.112.129.20.80: Flags [F.], seq 70, ack 851, win 501, options [nop,nop,TS val 3745194280 ecr 1963463486], length 0
17:53:58.007335 Out da:fa:f6:29:ab:8c ethertype IPv4 (0x0800), length 68: 10.112.129.20.80 > 10.112.129.21.43236: Flags [F.], seq 851, ack 71, win 509, options [nop,nop,TS val 1963463487 ecr 3745194280], length 0
17:53:58.007386  In ee:ee:ee:ee:ee:ee ethertype IPv4 (0x0800), length 68: 10.112.129.21.43236 > 10.112.129.20.80: Flags [.], ack 852, win 501, options [nop,nop,TS val 3745194280 ecr 1963463487], length 0
17:54:01.014688  In ee:ee:ee:ee:ee:ee ethertype IPv4 (0x0800), length 76: 10.112.129.21.33082 > 10.112.129.20.80: Flags [S], seq 4256920822, win 64240, options [mss 1460,sackOK,TS val 3745197287 ecr 0,nop,wscale 7], length 0
17:54:01.014718 Out da:fa:f6:29:ab:8c ethertype IPv4 (0x0800), length 76: 10.112.129.20.80 > 10.112.129.21.33082: Flags [S.], seq 394146605, ack 4256920823, win 65160, options [mss 1460,sackOK,TS val 1963466494 ecr 3745197287,nop,wscale 7], length 0
17:54:01.014742  In ee:ee:ee:ee:ee:ee ethertype IPv4 (0x0800), length 68: 10.112.129.21.33082 > 10.112.129.20.80: Flags [.], ack 1, win 502, options [nop,nop,TS val 3745197287 ecr 1963466494], length 0
17:54:01.014834  In ee:ee:ee:ee:ee:ee ethertype IPv4 (0x0800), length 137: 10.112.129.21.33082 > 10.112.129.20.80: Flags [P.], seq 1:70, ack 1, win 502, options [nop,nop,TS val 3745197288 ecr 1963466494], length 69: HTTP: GET / HTTP/1.1
17:54:01.014843 Out da:fa:f6:29:ab:8c ethertype IPv4 (0x0800), length 68: 10.112.129.20.80 > 10.112.129.21.33082: Flags [.], ack 70, win 509, options [nop,nop,TS val 1963466495 ecr 3745197288], length 0
17:54:01.015010 Out da:fa:f6:29:ab:8c ethertype IPv4 (0x0800), length 306: 10.112.129.20.80 > 10.112.129.21.33082: Flags [P.], seq 1:239, ack 70, win 509, options [nop,nop,TS val 1963466495 ecr 3745197288], length 238: HTTP: HTTP/1.1 200 OK
17:54:01.015046  In ee:ee:ee:ee:ee:ee ethertype IPv4 (0x0800), length 68: 10.112.129.21.33082 > 10.112.129.20.80: Flags [.], ack 239, win 501, options [nop,nop,TS val 3745197288 ecr 1963466495], length 0
17:54:01.015061 Out da:fa:f6:29:ab:8c ethertype IPv4 (0x0800), length 680: 10.112.129.20.80 > 10.112.129.21.33082: Flags [P.], seq 239:851, ack 70, win 509, options [nop,nop,TS val 1963466495 ecr 3745197288], length 612: HTTP
17:54:01.015071  In ee:ee:ee:ee:ee:ee ethertype IPv4 (0x0800), length 68: 10.112.129.21.33082 > 10.112.129.20.80: Flags [.], ack 851, win 501, options [nop,nop,TS val 3745197288 ecr 1963466495], length 0
17:54:01.015404  In ee:ee:ee:ee:ee:ee ethertype IPv4 (0x0800), length 68: 10.112.129.21.33082 > 10.112.129.20.80: Flags [F.], seq 70, ack 851, win 501, options [nop,nop,TS val 3745197288 ecr 1963466495], length 0
17:54:01.016046 Out da:fa:f6:29:ab:8c ethertype IPv4 (0x0800), length 68: 10.112.129.20.80 > 10.112.129.21.33082: Flags [F.], seq 851, ack 71, win 509, options [nop,nop,TS val 1963466496 ecr 3745197288], length 0
17:54:01.016096  In ee:ee:ee:ee:ee:ee ethertype IPv4 (0x0800), length 68: 10.112.129.21.33082 > 10.112.129.20.80: Flags [.], ack 852, win 501, options [nop,nop,TS val 3745197289 ecr 1963466496], length 0
```
```shell
root@cl1m6nopi27bl4p93idt-adof:/var/log/pods/default_nginx-distroless_46d4612a-5d7e-4744-ba40-7b2784bef4d6# ll
total 28
drwxr-xr-x  7 root root 4096 Jul 29 17:53 ./
drwxr-x--- 17 root root 4096 Jul 29 18:00 ../
drwxr-xr-x  2 root root 4096 Jul 29 17:49 debugger-6mhjh/
drwxr-xr-x  2 root root 4096 Jul 29 17:53 debugger-ddz8n/
drwxr-xr-x  2 root root 4096 Jul 29 17:48 debugger-mj98g/
drwxr-xr-x  2 root root 4096 Jul 29 17:44 debugger-w6xdc/
drwxr-xr-x  2 root root 4096 Jul 29 17:44 nginx-distroless/
root@cl1m6nopi27bl4p93idt-adof:/var/log/pods/default_nginx-distroless_46d4612a-5d7e-4744-ba40-7b2784bef4d6# cd nginx-distroless/
root@cl1m6nopi27bl4p93idt-adof:/var/log/pods/default_nginx-distroless_46d4612a-5d7e-4744-ba40-7b2784bef4d6/nginx-distroless# ll
total 52
drwxr-xr-x 2 root root  4096 Jul 29 17:44 ./
drwxr-xr-x 7 root root  4096 Jul 29 17:53 ../
-rw-r----- 1 root root 38165 Jul 29 18:02 0.log
root@cl1m6nopi27bl4p93idt-adof:/var/log/pods/default_nginx-distroless_46d4612a-5d7e-4744-ba40-7b2784bef4d6/nginx-distroless# cat 0.log 
2025-07-29T17:47:53.95612373Z stdout F 10.112.129.21 - - [30/Jul/2025:01:47:53 +0800] "GET / HTTP/1.1" 200 612 "-" "curl/8.15.0" "-"
2025-07-29T17:47:56.961901811Z stdout F 10.112.129.21 - - [30/Jul/2025:01:47:56 +0800] "GET / HTTP/1.1" 200 612 "-" "curl/8.15.0" "-"
2025-07-29T17:47:59.970202142Z stdout F 10.112.129.21 - - [30/Jul/2025:01:47:59 +0800] "GET / HTTP/1.1" 200 612 "-" "curl/8.15.0" "-"
2025-07-29T17:48:02.979496501Z stdout F 10.112.129.21 - - [30/Jul/2025:01:48:02 +0800] "GET / HTTP/1.1" 200 612 "-" "curl/8.15.0" "-"
2025-07-29T17:48:05.987925487Z stdout F 10.112.129.21 - - [30/Jul/2025:01:48:05 +0800] "GET / HTTP/1.1" 200 612 "-" "curl/8.15.0" "-"
2025-07-29T17:48:08.995525992Z stdout F 10.112.129.21 - - [30/Jul/2025:01:48:08 +0800] "GET / HTTP/1.1" 200 612 "-" "curl/8.15.0" "-"
2025-07-29T17:48:12.002761572Z stdout F 10.112.129.21 - - [30/Jul/2025:01:48:12 +0800] "GET / HTTP/1.1" 200 612 "-" "curl/8.15.0" "-"
2025-07-29T17:48:15.012317719Z stdout F 10.112.129.21 - - [30/Jul/2025:01:48:15 +0800] "GET / HTTP/1.1" 200 612 "-" "curl/8.15.0" "-"
2025-07-29T17:48:18.020111516Z stdout F 10.112.129.21 - - [30/Jul/2025:01:48:18 +0800] "GET / HTTP/1.1" 200 612 "-" "curl/8.15.0" "-"
2025-07-29T17:48:21.028787851Z stdout F 10.112.129.21 - - [30/Jul/2025:01:48:21 +0800] "GET / HTTP/1.1" 200 612 "-" "curl/8.15.0" "-"
2025-07-29T17:48:24.036517351Z stdout F 10.112.129.21 - - [30/Jul/2025:01:48:24 +0800] "GET / HTTP/1.1" 200 612 "-" "curl/8.15.0" "-"
2025-07-29T17:48:27.044688195Z stdout F 10.112.129.21 - - [30/Jul/2025:01:48:27 +0800] "GET / HTTP/1.1" 200 612 "-" "curl/8.15.0" "-"
2025-07-29T17:48:30.052475087Z stdout F 10.112.129.21 - - [30/Jul/2025:01:48:30 +0800] "GET / HTTP/1.1" 200 612 "-" "curl/8.15.0" "-"
```
