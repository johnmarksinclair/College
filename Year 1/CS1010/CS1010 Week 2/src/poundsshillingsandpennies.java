/* Write a program which takes in amounts of old Sterling pounds, 
	shillings and pennies and converts it to modern pounds and pennies.

Assume:
1 old penny = 67 new pennies (due to inflation!)
1 old shilling = 12 old pennies
1 old pound = 20 old shillings
1 new pound = 100 new pennies
 
e.g. the output should look appear like one of the lines below:
 1 old pound, 0 old shilling and 0 old pence = £160.80
 0 old pound, 1 old shilling and 0 old pence = £8.04
 0 old pound, 0 old shilling and 1 old pence = £0.67
 3 old pound, 2 old shilling and 5 old pence = £501.83

		SELF ASSESSMENT
   1. Did I use appropriate CONSTANTS instead of numbers within the code?
       Mark out of 10:	10
       I gave myself 10 because I believe I used appropriate constants.
   2. Did I use easy-to-understand, meaningful CONSTANT names?
       Mark out of 5:	5
       I gave myself 5 because i believe my constant names are easy to understand and meaningful.
   3. Did I format the CONSTANT names properly (in UPPERCASE)?
       Mark out of 5:	5
       I gave myself 5 because I formatted the constant names properly.
   4. Did I use easy-to-understand meaningful variable names?
       Mark out of 10:	10
       I gave myself 10 because my variable names are easy to understand and are relevant.
   5. Did I format the variable names properly (in lowerCamelCase)?
       Mark out of 10:	10
       I gave myself 10 because I formatted the variable names correctly.
   6. Did I indent the code appropriately?
       Mark out of 10:	10
       I gave myself 10 because I indented the code correctly.
   7. Did I read the input correctly from the user using (an) appropriate question(s)?
       Mark out of 10:	10
       I gave myself 10 because I read the input correctly from the user using (an) appropriate question(s).
   8. Did I compute the answer correctly for all cases?
       Mark out of 20:	20
       I gave myself 20 because I computed the answer correctly for all cases.
   9. Did I output the correct answer in the correct format (as shown in the examples)?
       Mark out of 10:	10
       I gave myself 10 because the correct answer, in the correct format was output.
   10. How well did I complete this self-assessment?
       Mark out of 10:	10
       I gave myself 10 because I believe I completed this self assessment well.
   Total Mark out of 100 (Add all the previous marks):	100
*/


import java.util.Scanner;

import javax.swing.JOptionPane;

public class poundsshillingsandpennies {
	public static void main (String [] args) {
		
		final int OLD_PENNY_TO_NEW_PENNY = 67;
		final int OLD_SHILLING_TO_OLD_PENNIES = 12;
		final int OLD_POUNDS_TO_OLD_SHILLINGS = 20;
		final int NEW_POUND_TO_NEW_PENNIES = 100;
		
		String inputOne = JOptionPane.showInputDialog("How many old pounds do you have?");
		Scanner inputScanner = new Scanner(inputOne);
		int oldPounds = inputScanner.nextInt();
		String inputTwo = JOptionPane.showInputDialog("How many old shillings do you have?");
		inputScanner = new Scanner(inputTwo);
		int oldShillings = inputScanner.nextInt();
		String inputThree = JOptionPane.showInputDialog("How many old pennies do you have?");
		inputScanner = new Scanner(inputThree);
		int oldPennies = inputScanner.nextInt();
		
		int oldPoundsToOldShillings = oldPounds*OLD_POUNDS_TO_OLD_SHILLINGS;
		int totalOldShillings = oldPoundsToOldShillings + oldShillings;
		int oldShillingsToOldPennies = totalOldShillings*OLD_SHILLING_TO_OLD_PENNIES;
		int totalOldPennies = oldShillingsToOldPennies + oldPennies;
		
		double totalNewPennies = totalOldPennies*OLD_PENNY_TO_NEW_PENNY;
		double totalNewPounds = totalNewPennies/NEW_POUND_TO_NEW_PENNIES;
		
		JOptionPane.showMessageDialog(null, oldPounds + " old pound, " + oldShillings + " old shilling, and " 
														+ oldPennies + " old pence = " + "£" + totalNewPounds);
	}
}