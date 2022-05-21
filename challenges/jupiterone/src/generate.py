import sys
import os
from PIL import Image

flag_str = "he2022{jim_jupiter_the_healthiest_man_in_chicago!!}"
flag_bin = ''.join([format(ord(c), "08b") for c in flag_str])
flag_len = int(len(flag_bin)) / 3

with Image.open('jupiter-one-orig.png') as img:
    h, w = img.size
    n = 0
    for y in range(h):
        for x in range(w):
            if (n < flag_len):
                p = list(img.getpixel((x, y)))
                for c in range(0, 3):
                    p[c] = p[c] & ~1 | int(flag_bin[3 * n + c])
                img.putpixel((x, y), tuple(p))
            n += 1
    img.save("jupiter-one.png", "PNG")