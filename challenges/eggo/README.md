# solution
- heap based pwning challenge
- abuse the unlink macro of the glibc `free` implementation to get an arbitrary read / write primitive
- the vulnerability that can be used is a heap overflow i.e. a `gets` call that directly write to memory
- this [exploit](https://heap-exploitation.dhavalkapil.com/attacks/unlink_exploit) can then be used to read and write to any memory
- with this we can first leak a libc address and defeat ASLR
- then we simply call `system` and get the flag

# generate
- install `gcc`
- run `./compile.sh` in `/problem`
- distribute the `egg` binary as well as the `libc.so`

# generate
```
cd src
docker build . -t eggo-build
docker run -td eggo-build
docker ps
docker cp <dockerid_from_ps>:/eggo .
docker cp <dockerid_from_ps>:/usr/lib/x86_64-linux-gnu/libc-2.33.so .

zip -r eggo.zip libc-2.33.so eggo
mv eggo.zip ../files
```