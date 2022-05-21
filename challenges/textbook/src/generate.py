from Crypto.Util.number import getPrime, long_to_bytes
from secrets import FLAG

assert FLAG.startswith("he2022")

p = getPrime(512)
q = getPrime(512)
e = 65537
n = p * q

def encrypt(content):
    ct = []
    for c in content:
        ct.append(pow(ord(c), e, n))
    return ct

print(encrypt(FLAG))
