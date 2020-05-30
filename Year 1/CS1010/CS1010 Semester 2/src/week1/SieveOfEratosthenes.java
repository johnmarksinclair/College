/* SELF ASSESSMENT  
   1.  createSequence:
   
		Did I use the correct method definition?
		Mark out of 5: 5
		Comment: Yes I think I did, it is an int[] so when invoked it returns an array from 2-N
		Did I create an array of size n (passed as the parameter) and initialise it?
		Mark out of 5: 5 
		Comment: Yes, it creates an array from 2-N
		Did I return the correct item?
		Mark out of 5: 5 
		Comment: Yes, the function returns an array from 2-N
		
   2.  crossOutMultiples
   
		Did I use the correct method definition?
		Mark out of 5: 5
		Comment: Yes, I think so, from my understanding it should be void as it 
						directly edits the array within the function
		Did I ensure the parameters are not null and one of them is a valid index into the array
		Mark out of 2: 2
		Comment: Yes, the two parameters cannot be null as int[] sequence has been initialised 
						by the createSequence() function which only gets invoked when the inputted 
						number is an integer >= 2, and count cannot be null as it is declared as 2 
						shortly beforehand
		Did I loop through the array using the correct multiple?
		Mark out of 5: 5
		Comment: Yes, it loops through the array, crossing out any multiples of n
		Did I cross out correct items in the array that were not already crossed out?
		Mark out of 3: 3 
		Comment: Yes
		
   3.  sieve   
   
		Did I have the correct function definition?
		Mark out of 5: 5 
		Comment: Yes, sieve() returns a integer array from 2-N, where all non prime number have 
						been 'crossed out' (given a value of 0)
		Did I make calls to other methods?
		Mark out of 5: 5 
		Comment: Yes, it makes calls to createSequence(), sequenceToString() and crossOutHigherMultiples()   
		Did I return an array with all non-prime numbers are crossed out?
		Mark out of 2: 2
		Comment: Yes, it returns an array where all non primes are crossed out (replaced with 0)
		
   4.  sequenceTostring  
   
		Did I have the correct function definition?
		Mark out of 5: 5
		Comment: Yes, this function returns a String
		Did I ensure the parameter to be used is not null?
		Mark out of 3: 3
		Comment: Yes, I checked using an if statement ensuring the passed array was not null
		Did I Loop through the array updating the String variable with the non-crossed out numbers and 
						the crossed numbers in brackets? 
		Mark out of 10: 10
		Comment: Yes, I did so by adding each array element to a string, and if an element was equal to 0 
						it would be the index+2 surrounded by square brackets that was put in the string
		
   5.  nonCrossedOutSubseqToString  
   
		Did I have the correct function definition
		Mark out of 5: 5 
		Comment: Yes, this function returns a String
		Did I ensure the parameter to be used is not null?  
		Mark out of 3: 3 
		Comment: Yes, I did so by using an if statement to check the array was not null
		Did I loop through the array updating the String variable with just the non-crossed out numbers? 
		Mark out of 5: 5
		Comment: Yes, I looped through the array, only added non-zero values to the string each time
		
   6.  main  
   
		Did I ask  the user for input n and handles input errors?  
		Mark out of 5: 5
		Comments: Yes, and it makes sure the user inputs an integer >= 2
		Did I make calls to other methods (at least one)?
		Mark out of 5: 5
		Comment: Yes, it makes calls to the sieve() and nonCrossedOutSubseqToString() methods
		Did I print the output as shown in the question?  
		Mark out of 5: 5
		Comment: Yes, it prints out exactly the same with no repeated lines
		
   7.  Overall
   
		Is my code indented correctly?
		Mark out of 4: 4 
		Comments: Yes
		Do my variable names make sense?
		Mark out of 4: 4
		Comments: I think so, they all apply directly to what they refer to
		Do my variable names, method names and class name follow the Java coding standard
		Mark out of 4: 4 
		Comments: Yes, variables and functions are in lowerCamelCase and the class name is in UpperCamelCase
		
      Total Mark out of 100 (Add all the previous marks): 100
*/

package week1;

import java.util.*;

public class SieveOfEratosthenes {

	public static void main(String[] args) 
	{
		System.out.print("Enter an integer greater than 2: ");
		Scanner scanner = new Scanner(System.in);
		if (scanner.hasNextInt())
		{
			int inputtedInt = scanner.nextInt();
			scanner.close();
			if (inputtedInt >= 2)
			{
				int[] sequence = sieve(inputtedInt);
				String nonCrossedOutSubseqString = nonCrossedOutSubseqToString(sequence);
				System.out.println(nonCrossedOutSubseqString);
			}
			else
				System.out.println("That integer is not geater than 2");
		}
		else
			System.out.println("That is not a valid input");
	}

	public static int[] sieve(int inputtedInt)
	{
		int[] sequence = createSequence(inputtedInt);
		String tempSequenceString = "";
		String initialOutputString = sequenceToString(sequence);
		System.out.println(initialOutputString);
		for (int count = 2; count <= inputtedInt; count++)
		{
			crossOutHigherMultiples(sequence, count);
			String sequenceString = sequenceToString(sequence);
			if (!sequenceString.equals(tempSequenceString))
			{
				System.out.println(sequenceString);
			}
			tempSequenceString = sequenceString;
		}
		return sequence;
	}
	
	public static int[] createSequence(int inputtedInt)
	{
		int[] sequence = new int[inputtedInt - 1];
		int count = 2;
		for (int index = 0; count <= inputtedInt; index++)
		{
			sequence[index] = count;
			count++;
		}
		return sequence;
	}
	
	public static void crossOutHigherMultiples(int[] sequence, int n)
	{
		for (int index = 0; index < sequence.length; index++)
		{
			if (sequence[index] % n == 0 && n != sequence[index])
			{
				sequence[index] = 0;
			}
		}
	}
	
	public static String sequenceToString(int[] sequence)
	{
		String sequenceString = "2";
		if (sequence != null)
		{
			for (int index = 1; index < sequence.length; index++)
			{
				if (sequence[index] == 0)
				{
					if (index == (sequence.length - 1))
						sequenceString = sequenceString + ", " + "[" + (index+2) + "]";
					else
						sequenceString = sequenceString + ", " + "[" + (index+2) + "]";
				}
				else 
				{
					if (index == (sequence.length - 1))
						sequenceString = sequenceString + ", " + sequence[index];
					else
						sequenceString = sequenceString + ", " + sequence[index];
				}
			}
		}
		return sequenceString;
	}
	
	public static String nonCrossedOutSubseqToString(int[] sequence)
	{
		String nonCrossedOutSubseq = "2";
		if (sequence != null)
		{
			for (int index = 1; index < sequence.length; index++)
			{
				if (sequence[index] != 0)
				{
					if (index == (sequence.length - 1))
						nonCrossedOutSubseq = nonCrossedOutSubseq + ", " + sequence[index];
					else
						nonCrossedOutSubseq = nonCrossedOutSubseq + ", " + sequence[index];
				}
			}
		}
		return nonCrossedOutSubseq;
	}
}