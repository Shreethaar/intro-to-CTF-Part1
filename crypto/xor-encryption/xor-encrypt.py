#! /usr/bin/python3

def encryptDecrypt(input):
	key = ['5']
	output = []
	
	for i in range(len(input)):
		xor_num = ord(input[i]) ^ ord(key[i%len(key)])
		output.append(chr(xor_num))
	
	return ''.join(output)


def main():
	encrypted = encryptDecrypt("CTF{xor-encrypt-decrypt}");
	print("Encrypted:"+encrypted);
	
	decrypted = encryptDecrypt(encrypted);
	print("Decrypted:"+decrypted);
	pass


if __name__ == '__main__':
	main()
