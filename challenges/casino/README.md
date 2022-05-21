# solution
Faulty PRNG implementation. PRNG is based on elliptic curves (Dual_EC_DRBG) and contains a backdoor.

1. find `d` (relation between P and Q)
  - `d = Q.discrete_log(P)`

2. play 8 rounds against the server
  - save the `id` output at the beginning
  - save sequence of first 8 bits

3. `id` relates to Q -> `(r * self.Q)[0].lift() >> 8`

4.  guess `(r * self.Q)[0].lift()` by shifting `id` << 8 again, and brute-forcing the 8 least significant bits
  - 256 possibilities
  - for each value, calculate the state using `d` -> state is `(r * self.R)[0].lift()`
    - `R = curve.lift_x(guess)` -> `state = Integer((d * R)[0])`
  - with the state, generate 8 random bits, and compare against bit sequence saved earlier
  - in case of a match, the state is (very likely) found

5. knowing the state, initialize a PRNG with it, and get the next bits to play

6. play enough rounds (to get at least 1337 credits)

7. buy the flag, which is encrypted

8. generate a PRNG again to calculate the AES symmetric key (check source code), and with it decrypt the flag

See `exploit.sage` (install sage and `sage -pip install pycryptodome`).