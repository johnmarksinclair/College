/* SELF ASSESSMENT 

1. readDictionary
- I have the correct method definition [Mark out of 5: 5]
- Comment: Yes, I have the correct method definition
- My method reads the words from the "words.txt" file. [Mark out of 5: 5]
- Comment: Yes, it reads from the file
- It returns the contents from "words.txt" in a String array or an ArrayList. [Mark out of 5: 5]
- Comment: Yes, the contents of the words.txt file are returned in a String array

2. readWordList
- I have the correct method definition [Mark out of 5: 5]
- Comment: 
- My method reads the words provided (which are separated by commas, saves them to an array or ArrayList of String references and returns it. [Mark out of 5: 5]
- Comment: 

3. isUniqueList
- I have the correct method definition [Mark out of 5: 5]
- Comment: 
- My method compares each word in the array with the rest of the words in the list. [Mark out of 5: 5]
- Comment: 
- Exits the loop when a non-unique word is found. [Mark out of 5: 5]
- Comment: 
- Returns true is all the words are unique and false otherwise. [Mark out of 5: 5]
- Comment: 

4. isEnglishWord
- I have the correct method definition [Mark out of 5: 5]
- Comment: 
- My method uses the binarySearch method in Arrays library class. [Mark out of 3: 3]
- Comment: 
- Returns true if the binarySearch method return a value >= 0, otherwise false is returned. [Mark out of 2: 2]
- Comment: 

5. isDifferentByOne
- I have the correct method definition [Mark out of 5: 5]
- Comment: 
- My method loops through the length of a words comparing characters at the same position in both words searching for one difference. [Mark out of 10: 10]
- Comment: 

6. isWordChain
- I have the correct method definition [Mark out of 5: 5]
- Comment: 
- My method calls isUniqueList, isEnglishWord and isDifferentByOne methods and prints the appropriate message [Mark out of 10: 10]
- Comment: 

7. main
- Reads all the words from file words.txt into an array or an ArrayList using the any of the Java.IO classes covered in lectures [Mark out of 10: 10]
- Comment: 
- Asks the user for input and calls isWordChain [Mark out of 5: 5]
- Comment: 

 Total Mark out of 100 (Add all the previous marks): 100
*/

package week8;

import java.util.*;
import java.io.*;

public class WordLinksGame {
	public final static int NUMBER_OF_WORDS = 658964;
	
	public static void main(String[] args) {
		boolean finished = false;
		while (!finished) {
			List<String> wordList;
			wordList = readWordList();
			if (wordList.size() > 1) {
				isWordChain(wordList);
			}
			else {
				finished = true;
			}
		}
	}
	
//	public static List<String> readDictionary() {
//		List<String> words = new ArrayList<String>();
//		try {
//			FileReader fileReader = new FileReader("words.txt");
//			BufferedReader bufferedReader = new BufferedReader(fileReader);
//			boolean endOfFile = false;
//			while (!endOfFile) {
//				String wordLine = bufferedReader.readLine();
//				if (wordLine != null) {
//					words.add(wordLine);
//				}
//				else 
//					endOfFile = true;
//			}
//			bufferedReader.close();
//			fileReader.close();
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return words;
//	}
	
	public static String[] readDictionary() {
		String[] words = new String[NUMBER_OF_WORDS];
		try {
			FileReader fileReader = new FileReader("words.txt");
			BufferedReader bufferedReader = new BufferedReader(fileReader);
			boolean endOfFile = false;
			int index = 0;
			while (!endOfFile) {
				String wordLine = bufferedReader.readLine();
				if (wordLine != null) {
					words[index] = wordLine;
				}
				else 
					endOfFile = true;
				index++;
			}
			bufferedReader.close();
			fileReader.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return words;
	}
	
	public static List<String> readWordList() {
		List<String> words = new ArrayList<String>();
		Scanner scanner = new Scanner(System.in);
		System.out.println("Enter a comma separated list of words (or an empty list to quit):");
		String line = scanner.nextLine();
		words = (List<String>)Arrays.asList(line.split(", "));
		return words;
	}
	
	public static boolean isUniqueList(List<String> list) {
		boolean isUnique = true;
		for (int index = 0; index < list.size(); index++) {
			for (int count = 0; count < list.size(); count++) {
				if (list.get(index).equals(list.get(count)) && index != count) {
					isUnique = false;
				}
			}
		}
		return isUnique;
	}
	
//	public static boolean isEnglishWord(String word) {
//		List<String> dictionary = readDictionary();
//		int position = Collections.binarySearch(dictionary, word);
//		if (position >= 0)
//			return true;
//		else
//			return false;
//	}
	
	public static boolean isEnglishWord(String word) {
		String[] dictionary = readDictionary();
		int position = Arrays.binarySearch(dictionary, word);
		if (position == -1)
			return false;
		else
			return true;
	}
	
	public static boolean isDifferentByOne(String string1, String string2) {
		if (string1.length() != string2.length()) {
			return false;
		}
		else {
			int differences = 0;
			for (int index = 0; index <string1.length(); index++) {
				if (string1.charAt(index) != string2.charAt(index))
					differences++;
			}
			if (differences <= 1)
				return true;
			else
				return false;
		}
	}
	
	public static void isWordChain(List<String> list) {
		boolean valid = true;
		if (isUniqueList(list)) {
			for (int index = 0; index < list.size()-1 && valid; index++) {
				String word1 = list.get(index);
				String word2 = list.get(index + 1);
				if (!isEnglishWord(word1) || !isEnglishWord(word2) || !isDifferentByOne(word1, word2)) {
					valid = false;
				}
			}
		}
		if (valid)
			System.out.println("Valid chain of words from Lewis Carroll's word-links game.");
		else
			System.out.println("Not a valid chain of words from Lewis Carroll's word-links game.");
	}
}