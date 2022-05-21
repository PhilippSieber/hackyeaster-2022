from random import randint
from secrets import flag
from Crypto.Cipher import AES
from Crypto.Hash import SHA256
from Crypto.Util.Padding import pad

class RNG:
    def __init__(self):
        p = 115792089210356248762697446949407573530086143415290314195533631308867097853951
        b = 0x5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b
        self.curve = EllipticCurve(GF(p), [-3,b])

        self.P = self.curve.lift_x(15957832354939571418537618117378383777560216674381177964707415375932803624163)
        self.Q = self.curve.lift_x(66579344068745538488594410918533596972988648549966873409328261501470196728491)
        
        self.state = randint(1, 2**256)
        
    def next(self):
        r = (self.state * self.P)[0].lift()
        self.state = (r * self.P)[0].lift()
        return (r * self.Q)[0].lift() >> 8

class Casino:
    def __init__(self, rng):
        self.rng = rng
        self.balance = 10

    def play(self):
        print("Your bet: ", end='')
        bet = input()
        if (bet in ["0", "1"]):
            bet = Integer(bet)
            if (self.rng.next() % 2 == bet):
                self.balance += 1
            else:
                self.balance -= 1
                if (self.balance == 0):
                    print("You are broke... play again")
                    exit()
            print(f"Your current balance: {self.balance}")
        else:
            print("Invalid bet option, use either 0 or 1")
            
    def buy_flag(self):
        if (self.balance >= 1337):
            key = SHA256.new(str(self.rng.next()).encode('ascii')).digest()
            cipher = AES.new(key, AES.MODE_ECB)
            print(cipher.encrypt(pad(flag.encode('ascii'), 16)).hex())
        else:
            print("No flag for the poor. Gamble more")

def main():
    rng = RNG()
    casino = Casino(rng)

    print("Welcome to the Casino")
    print(f"Your id is {rng.next()}")
    print("What would you like to do?")
    print("(p)lay and win some money")
    print("(b)uy the flag")

    while (True):
        print("> ", end='')
        option = input()

        if (not option in ["b", "p"]):
            print("Unknown option, use 'b' or 'p'")
        elif (option == "b"):
            casino.buy_flag()
        elif (option == "p"):
            casino.play()

if __name__ == '__main__':
    main()

