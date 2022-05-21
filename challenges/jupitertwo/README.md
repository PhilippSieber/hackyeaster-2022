# solution
- LSB steganography
  - only Red and Blue channels (image is a hint)
  - with a pixel offset
- StegSolve -> data extract
  - will not show the flag, due to the offset
  - export binary
  - encode to bits
  - CyberChef: remove one bit at the start after another, until flag shows up
    - 6 bits inserted at the start