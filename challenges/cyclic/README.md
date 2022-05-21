# solution
- reverse the binary
  - see cyclic_reversing.odt
- calculate numbers of flag[] modulo 39 (length of alphabet)
- lookup in alphabet
- see solve.py

# generate
```
cd src
docker build . -t cyclic
docker ps
docker cp <dockerid_from_ps>:/tmp/work/cyclic .
```