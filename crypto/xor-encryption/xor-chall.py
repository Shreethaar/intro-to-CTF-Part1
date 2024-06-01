
def xor_decrypt(cipher,key):
    return ''.join(chr(ord(char)^key) for char in cipher)

def main():
    ciphertext="FQC~}jw(`kfw|uq(a`fw|uqx"
    print(f"You have to decrypt this:\n{ciphertext}")
    while True:
        key=int(input("Guess the XOR key (1-10): "))
        decrypt=xor_decrypt(ciphertext,key)
        print(decrypt)

if __name__ == "__main__":
    main()
