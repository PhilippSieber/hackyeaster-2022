# solution
- see `exploit.py`
- given: p, q, A
- calculate b
  - b = log q B mod p
  - discrete log
- calculate encryption key
  - A ^ b mod p
- decrypt

The decrypted payloads and responses are:
```
IN:  ls
OUT: sensitive.txt

IN:  cat sensitive.txt
OUT: he2022{wh4dy4_m3an_32_b1t5_1s_1n53cur3}
```

# generate
```
flag = b'he2022{wh4dy4_m3an_32_b1t5_1s_1n53cur3}\n'
enc = encrypt(cipher, flag)
print(enc)
```