from pwn import *

def findFlagLength():
    conn.sendline('20')
    conn.sendline('-' * 16)
    conn.recvline()
    cipher_hex = conn.recvline()
    return (len(cipher_hex) - 64) // 20 // 2

def findCharacter(found, length, conn):
    offset = len(found) + 1
    for patties in range(1,24):
        if (patties * length) % 16 == offset % 16:
            block = (patties * length - (offset % 16)) // 16 + 1 - offset // 16
            break
    for c in '{}_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,;.:-+!?=()':
        bun = (c + found + '-' * 15)[0:16]
        bun = bun[::-1]
        conn.sendline(str(patties))
        conn.sendline(bun)
        conn.recvline()
        cipher_hex = conn.recvline()
        if cipher_hex[0:32] == cipher_hex[block*32:block*32+32]:
            burger = ""
            burger += bun[::-1] # the bottom bun, flipped
            # no patties
            burger += bun # the top bun
            print(burger)
            return c
    print('fail')
    exit()

found = ''
conn = remote('46.101.107.117', 2207)
conn.recvline()
conn.recvline()
conn.recvline()
length = findFlagLength()
print('flag length: ' + str(length))
for i in range(length):
    found = findCharacter(found, length, conn) + found
    print(found)