/* SELF ASSESSMENT

 1. Did I use easy-to-understand meaningful variable names formatted properly (in lowerCamelCase)?

        Mark out of 5: 5
        Comment: I think I did.

 2. Did I indent the code appropriately?

        Mark out of 5: 5
        Comment: Yes.

 3. Did I write the initialiseHighScores function correctly (parameters, return type and function body) and invoke it correctly?

       Mark out of 15: 15
        Comment: Yes, I did.

 4. Did I write the printHighScores function correctly (parameters, return type and function body) and invoke it correctly?

       Mark out of 15: 15
       Comment: Yes, I did.

 5. Did I write the higherThan function correctly (parameters, return type and function body) and invoke it correctly?

       Mark out of 15: 15
       Comment:  Yes, I did.

 6. Did I write the insertScore function correctly (parameters, return type and function body) and invoke it correctly?

       Mark out of 20: 20
       Comment: I think I did I did it correctly, from what I understood the function to be.

 7. Did I write the main function body correctly (first asking for the number of scores to be maintained and then repeatedly asking for scores)?

       Mark out of 20: 20
       Comment: Yes, I did.

 8. How well did I complete this self-assessment?

       Mark out of 5: 5
       Comment: I think i completed it well.

 Total Mark out of 100 (Add all the previous marks): 100

*/ 

import java.util.*;

public class HighScores {

	public static void main(String[] args) 
	{
		int[] highScores = null;
		int newScore = 0;
		Scanner scanner = new Scanner (System.in);
		System.out.print("Input the number of scores to be maintained: ");
		if (scanner.hasNextInt())
		{
			int numberOfScores = scanner.nextInt();
			highScores = new int[numberOfScores];
		}
		initialisehighScores(highScores);
		printHighScores(highScores);
		boolean quit = false;
		while (!quit)
		{
			System.out.print("Input new score or type 'quit': ");
			if (scanner.hasNextInt())
			{
				newScore = scanner.nextInt();
				insertScore(highScores, newScore);
			}
			else if (scanner.hasNext("quit"))
			{
				quit = true;
			}
			printHighScores(highScores);
		}
		scanner.close();
	}
	
	public static void initialisehighScores(int[] highScores)
	{
		for (int index = 0; index < highScores.length; index++)
		{
			highScores[index] = 0;
		}
	}
	
	public static void printHighScores(int[] highScores)
	{
		String outputString = "";
		for(int index = 0; index < highScores.length; index++)
		{
			if (index == highScores.length-1)
			{
				outputString = outputString + highScores[index] + ".";
			}
			else
			{
				outputString = outputString + highScores[index] + ", ";
			}
		}
		System.out.println("The high scores are " + outputString);
	}
	
	public static boolean higherThan(int[] highScores, int newScore)
	{
		boolean isHigherThan = false;
		if (highScores != null)
		{
			for (int index = 0; index < highScores.length; index++)
			{
				if (newScore > highScores[index])
				{
					isHigherThan = true;
				}
			}
		}
		return isHigherThan;
	}
	
	public static void insertScore(int[] highScores, int newScore)
	{
		int[] newHighScores = highScores;
		int tempNewScore = newScore;
		boolean finished = false;
		if (higherThan(highScores, newScore))
		{
			for (int index = 0; index < highScores.length; index++)
			{
				if (tempNewScore > highScores[index] && !finished)
				{
					int oldHighScore = highScores[index];
					newHighScores[index] = tempNewScore;
					tempNewScore = oldHighScore;
					insertScore(highScores, tempNewScore);
					finished = true;
				}
			}
			
			for (int counter = 0; counter < highScores.length; counter++)
			{
				highScores[counter] = newHighScores[counter];
			}
		}
	}
}