/* SELF ASSESSMENT

 1. Did I use easy-to-understand meaningful variable names formatted properly (in lowerCamelCase)?

        Mark out of 5: 5
        Comment:  Yes, i believe i did, all names relate to the variables they are associated with.

 2. Did I indent the code appropriately?

        Mark out of 5: 5
        Comment:  yes, i did.

 3. Did I write the createCipher function correctly (parameters, return type and function body) and invoke it correctly?

       Mark out of 20: 20
        Comment:  i think i did, the parameters passed were as instructed and it rambomly assigned a cipher text 
        						to each plain text character.

 4. Did I write the encrypt function correctly (parameters, return type and function body) and invoke it correctly?

       Mark out of 20: 20
        Comment: yes, i passed the correct parameter and it encrypted the phrase according to the cipher.

 5. Did I write the decrypt function correctly (parameters, return type and function body) and invoke it correctly?

       Mark out of 20: 20
        Comment:i think so, my decrypt function takes only the encrypted phrase and the cipher and returns the 
        							original plain text, decrypted phrase.

 6. Did I write the main function body correctly (repeatedly obtaining a string and encrypting it and then decrypting the encrypted version)?

       Mark out of 25: 25
        Comment: yes, it repeated asks for a new string unless you type 'quit'.

 7. How well did I complete this self-assessment?

        Mark out of 5: 5
        Comment: i think i completed it well.

 Total Mark out of 100 (Add all the previous marks): 100

*/ 

import  java.util.*;

public class Cipher {
	
	public static void main(String[] args) 
	{
		char[] alphabet = "abcdefghijklmnopqrstuvwxyz ".toCharArray();
		char[] cipherArray = new char[alphabet.length];
		System.arraycopy(alphabet, 0, cipherArray, 0, alphabet.length);
		boolean finished = false;
		Scanner scanner = new Scanner(System.in);
		while (finished == false)
		{
			createCipher(alphabet, cipherArray);
			System.out.println("Input message to be encrypted, or type quit\n");
			scanner = new Scanner(System.in);
			if (scanner.hasNext("quit"))
			{
				finished = true;
			}
			else
			{
				String inputString = scanner.nextLine();
				String lowerCaseInputString = inputString.toLowerCase();
				char[] characterArray = lowerCaseInputString.toCharArray();
				
				String shufAlpha = new String(cipherArray);
				System.out.println("\nCipher text: [" + shufAlpha + "]");
				String alpha = new String(alphabet);
				System.out.println("\nMapped to:   [" + alpha + "]");
				
				String encryptedInput = encrypt(characterArray, cipherArray);
				System.out.println("\nYou're encrypted message is: '" + encryptedInput + "'");
				
				String decryptedInput = decrypt(encryptedInput, cipherArray);
				System.out.println("\nWhen decrypted, '" + encryptedInput + "' reads: " + decryptedInput + "\n");
			}
		}
		scanner.close();
	}

	public static void createCipher(char[] alphabet, char[] cipherArray)
	{
		int numberOfElements = alphabet.length;
		for (int index = 0; index < numberOfElements; index++)
		{
			int randomIndex = index + (int)(Math.random() * (numberOfElements - index));
			char temp = cipherArray[randomIndex];
			cipherArray[randomIndex] = cipherArray[index];
			cipherArray[index] = temp;
		}
	}
	
	public static String encrypt(char[] characterArray, char[] cipherArray)
	{
		char [] encryptedCharArray = new char[characterArray.length];
		System.arraycopy(characterArray, 0, encryptedCharArray, 0, characterArray.length);
		
		for (int index = 0; index < characterArray.length; index++)
		{
			switch (characterArray[index])
			{
			case 'a': 
				encryptedCharArray[index] = cipherArray[0];
				break;
			case 'b': 
				encryptedCharArray[index] = cipherArray[1];
				break;
			case 'c': 
				encryptedCharArray[index] = cipherArray[2];
				break;
			case 'd': 
				encryptedCharArray[index] = cipherArray[3];
				break;
			case 'e': 
				encryptedCharArray[index] = cipherArray[4];
				break;
			case 'f': 
				encryptedCharArray[index] = cipherArray[5];
				break;
			case 'g': 
				encryptedCharArray[index] = cipherArray[6];
				break;
			case 'h': 
				encryptedCharArray[index] = cipherArray[7];
				break;
			case 'i': 
				encryptedCharArray[index] = cipherArray[8];
				break;
			case 'j': 
				encryptedCharArray[index] = cipherArray[9];
				break;
			case 'k': 
				encryptedCharArray[index] = cipherArray[10];
				break;
			case 'l': 
				encryptedCharArray[index] = cipherArray[11];
				break;
			case 'm': 
				encryptedCharArray[index] = cipherArray[12];
				break;
			case 'n': 
				encryptedCharArray[index] = cipherArray[13];
				break;
			case 'o': 
				encryptedCharArray[index] = cipherArray[14];
				break;
			case 'p': 
				encryptedCharArray[index] = cipherArray[15];
				break;
			case 'q': 
				encryptedCharArray[index] = cipherArray[16];
				break;
			case 'r': 
				encryptedCharArray[index] = cipherArray[17];
				break;
			case 's': 
				encryptedCharArray[index] = cipherArray[18];
				break;
			case 't': 
				encryptedCharArray[index] = cipherArray[19];
				break;
			case 'u': 
				encryptedCharArray[index] = cipherArray[20];
				break;
			case 'v': 
				encryptedCharArray[index] = cipherArray[21];
				break;
			case 'w': 
				encryptedCharArray[index] = cipherArray[22];
				break;
			case 'x': 
				encryptedCharArray[index] = cipherArray[23];
				break;
			case 'y': 
				encryptedCharArray[index] = cipherArray[24];
				break;
			case 'z': 
				encryptedCharArray[index] = cipherArray[25];
				break;
			case ' ': 
				encryptedCharArray[index] = cipherArray[26];
				break;
			default:
			}
		}
		
		String encryptedCharString = new String(encryptedCharArray);
		return encryptedCharString;
	}
	
	public static String decrypt(String encryptedInput, char[] cipherArray)
	{
		char[] encryptedInputArray = encryptedInput.toCharArray();
		char [] decryptedCharArray = new char[encryptedInputArray.length];
		System.arraycopy(encryptedInputArray, 0, decryptedCharArray, 0, encryptedInputArray.length);
		
		for (int count = 0; count < encryptedInputArray.length; count++)
		{
			if (encryptedInputArray[count] == cipherArray[0])
				decryptedCharArray[count] = 'a';
			else if (encryptedInputArray[count] == cipherArray[1])
				decryptedCharArray[count] = 'b';
			else if (encryptedInputArray[count] == cipherArray[2])
				decryptedCharArray[count] = 'c';
			else if (encryptedInputArray[count] == cipherArray[3])
				decryptedCharArray[count] = 'd';
			else if (encryptedInputArray[count] == cipherArray[4])
				decryptedCharArray[count] = 'e';
			else if (encryptedInputArray[count] == cipherArray[5])
				decryptedCharArray[count] = 'f';
			else if (encryptedInputArray[count] == cipherArray[6])
				decryptedCharArray[count] = 'g';
			else if (encryptedInputArray[count] == cipherArray[7])
				decryptedCharArray[count] = 'h';
			else if (encryptedInputArray[count] == cipherArray[8])
				decryptedCharArray[count] = 'i';
			else if (encryptedInputArray[count] == cipherArray[9])
				decryptedCharArray[count] = 'j';
			else if (encryptedInputArray[count] == cipherArray[10])
				decryptedCharArray[count] = 'k';
			else if (encryptedInputArray[count] == cipherArray[11])
				decryptedCharArray[count] = 'l';
			else if (encryptedInputArray[count] == cipherArray[12])
				decryptedCharArray[count] = 'm';
			else if (encryptedInputArray[count] == cipherArray[13])
				decryptedCharArray[count] = 'n';
			else if (encryptedInputArray[count] == cipherArray[14])
				decryptedCharArray[count] = 'o';
			else if (encryptedInputArray[count] == cipherArray[15])
				decryptedCharArray[count] = 'p';
			else if (encryptedInputArray[count] == cipherArray[16])
				decryptedCharArray[count] = 'q';
			else if (encryptedInputArray[count] == cipherArray[17])
				decryptedCharArray[count] = 'r';
			else if (encryptedInputArray[count] == cipherArray[18])
				decryptedCharArray[count] = 's';
			else if (encryptedInputArray[count] == cipherArray[19])
				decryptedCharArray[count] = 't';
			else if (encryptedInputArray[count] == cipherArray[20])
				decryptedCharArray[count] = 'u';
			else if (encryptedInputArray[count] == cipherArray[21])
				decryptedCharArray[count] = 'v';
			else if (encryptedInputArray[count] == cipherArray[22])
				decryptedCharArray[count] = 'w';
			else if (encryptedInputArray[count] == cipherArray[23])
				decryptedCharArray[count] = 'x';
			else if (encryptedInputArray[count] == cipherArray[24])
				decryptedCharArray[count] = 'y';
			else if (encryptedInputArray[count] == cipherArray[25])
				decryptedCharArray[count] = 'z';
			else if (encryptedInputArray[count] == cipherArray[26])
				decryptedCharArray[count] = ' ';
		}
		
		String decryptedCharString = new String(decryptedCharArray);
		return decryptedCharString;
	}
}