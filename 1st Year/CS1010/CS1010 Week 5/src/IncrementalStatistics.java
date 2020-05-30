/* SELF ASSESSMENT 
   1. Did I use easy-to-understand meaningful variable names? 
       Mark out of 10: 10
       Comment: Yes.
   2. Did I format the variable names properly (in lowerCamelCase)? 
       Mark out of 5: 5
       Comment: Yes.
   3. Did I indent the code appropriately? 
       Mark out of 10: 10
       Comment: Yes.
   4. Did I input the numbers one at a time from the command line?
       Mark out of 10:  10
       Comment: Yes.
   5. Did I check the input to ensure that invalid input was handled appropriately?
       Mark out of 10:  10
       Comment: Yes.
   6. Did I use an appropriate while or do-while loop to allow the user to enter numbers until they entered exit/quit?
       Mark out of 20:  20
       Comment: Yes.
   7. Did I implement the loop body correctly so that the average and variance were updated and output appropriately?
       Mark out of 30:  30
       Comment: Yes.
   8. How well did I complete this self-assessment? 
       Mark out of 5: 5
       Comment: I think I completed it well.
   Total Mark out of 100 (Add all the previous marks): 100
*/

import java.util.Scanner;

public class IncrementalStatistics {

	public static void main(String[] args) {
		
		int numberCount = 0;
		double sumOfInputs = 0;
		double prevAverage = 0;
		double prevVariance = 0;
		System.out.println("This program computes the average and variance of all numbers entered.");
		Scanner scanner = new Scanner( System.in );
		boolean moreInputs = true;
		while (moreInputs)
		{
			System.out.println("Enter a number (or type 'exit'): ");
			scanner = new Scanner(System.in);
			if (scanner.hasNextDouble())
			{
				double input = scanner.nextDouble();
				sumOfInputs = sumOfInputs + input;
				numberCount++;
				double average = prevAverage + (input - prevAverage)/numberCount;
				double variance = ((prevVariance*(numberCount - 1)) + (input - prevAverage)*(input-average))/numberCount;
				System.out.println("So far the average is " + average + 
													" and the variance is " + variance);
				prevAverage = average;
				prevVariance = variance;
			}
			else if (scanner.hasNext("exit"))
			{
				moreInputs = false;
			}
			else
			{
				System.out.println("This is not a valid input, try again");
			}
		}
		System.out.println("Goodbye.");
		scanner.close();
	}
} 