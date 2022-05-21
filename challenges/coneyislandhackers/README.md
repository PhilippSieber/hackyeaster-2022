# solution
- send parameter multiple times
- use array indices
  - `?passphrase[0]=eat&passphrase[1]=sleep&passphrase[2]=hack&passphrase[3]=repeat`
- submitting the passphrase as-is is blocked (`,` is not allowed)
- submitting multiple with array indices is blocked (`passphrase=` only allowed once)
  -`?passphrase=eat&passphrase=sleep&passphrase=hack&passphrase=repeat`