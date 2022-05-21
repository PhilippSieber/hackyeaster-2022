# solution
- reverse-engineer Go program (compiled for Linux/ELF, statically linked)
- e.g. in Ghidra
  - functions -> main.maschadar, etc.
- find length check: 28
- find encrypted value that is checked: `aug{mepdpeuvisvohxhqjxfhr`
- find methods
  - not stripped
  - maschadar = shuffle
  - remplazzar = replace
  - verifitgar = verify / check
- reverse the encryption process
  value -> un-remplazzar -> un-maschadar
- see src/solver

# generate
- use Docker to compile go binary