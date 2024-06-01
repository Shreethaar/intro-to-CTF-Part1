def decrypt(flag):
    key = ['C','T','F']
    output = []

    for i in range(len(flag)):
        xor_num = ord(flag[i]) ^ ord(key[i % len(key)])
        output.append(chr(xor_num))

    return ''.join(output)

def main():
    flag=
