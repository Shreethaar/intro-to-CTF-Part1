#! /usr/bin/python3

def xor(flag,key):
    result=''
    for i in range(len(flag)):
        result+=chr(ord(flag[i])^key)
    return result

flag="CTF{xor-encrypt-decrypt}"
key=5
xor_string=xor(flag,key)
print(xor_string)
