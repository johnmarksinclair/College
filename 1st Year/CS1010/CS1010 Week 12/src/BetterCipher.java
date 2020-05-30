import  java.util.*;

public class BetterCipher {
	
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
				
				String encryptedString = encrypt(characterArray, cipherArray);
				System.out.println("\nYou're encrypted message is: '" + encryptedString + "'");
				
				String decryptedInput = decrypt(encryptedString, cipherArray);
				System.out.println("\nWhen decrypted, '" + encryptedString + "' reads: " + decryptedInput + "\n");
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
		int charToASCII = 0;
		for (int index = 0; index < characterArray.length; index++)
		{
			charToASCII = (int) characterArray[index];
			if (charToASCII == 32)
			{
				charToASCII = 26;
			}
			else
			{
				charToASCII = charToASCII - 97;
			}
			characterArray[index] = (char) cipherArray[charToASCII];
		}
		String encryptedCharString  = new String(characterArray);
		return encryptedCharString;
	}
	
	public static String decrypt(String encryptedString, char[] cipherArray)
	{
		char[] encryptedStringArray = encryptedString.toCharArray();
		boolean match = false;
		int index2 = 0;
		
		for (int index = 0; index < encryptedStringArray.length; index++)
		{
			index2 = 0;
			match = false;
			while(!match)
			{
				if (encryptedStringArray[index] == cipherArray[index2])
				{
					match = true;
					if (index2 != 26) 
					{
						encryptedStringArray[index] = (char) (index2 + 97);
					}
					else
					{
						encryptedStringArray[index] = (char) (32);
					}
				}
				index2++;
			}
		}
		
		String decryptedString = new String(encryptedStringArray);
		return decryptedString;
	}
}