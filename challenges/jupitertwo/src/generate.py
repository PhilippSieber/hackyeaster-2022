import sys
import os
from PIL import Image

flag_str = "he2022{jupiter_haz_a_great_red_spot!}  "
flag_bin = ''.join([format(ord(c), "08b") for c in flag_str])
flag_len = int(len(flag_bin)) / 2

with Image.open('jupiter-two-orig.png') as img:
    w, h = img.size
    n = 0
    o = 1413
    for y in range(h):
        for x in range(w):
            if (n >= o and n < o + flag_len):
                p = list(img.getpixel((x, y)))
                for c in range(0, 3):
                    if (c == 0 or c == 2):
                        # red and blue only
                        p[c] = p[c] & ~1 | int(flag_bin[2 * (n - o) + (c // 2)])
                img.putpixel((x, y), tuple(p))
            n += 1
    img.save("jupiter-two.png", "PNG")