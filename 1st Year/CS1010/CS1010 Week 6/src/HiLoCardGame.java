/* SELF ASSESSMENT 
   1. Did I use appropriate CONSTANTS instead of numbers within the code? 
       Mark out of 5:5
       Comment: Yes.
   2. Did I use easy-to-understand, meaningful CONSTANT names formatted correctly in UPPERCASE? 
       Mark out of 5:5
       Comment: Yes
   3. Did I use easy-to-understand meaningful variable names? 
       Mark out of 10:10
       Comment: Yes.
   4. Did I format the variable names properly (in lowerCamelCase)? 
       Mark out of 5:5
       Comment: Yes.
   5. Did I indent the code appropriately? 
       Mark out of 10:10
       Comment: Yes.
   6. Did I use an appropriate loop to allow the user to enter their guesses until they win or lose? 
       Mark out of 20:20
       Comment: Yes.
   7. Did I check the input to ensure that invalid input was handled appropriately? 
       Mark out of 10:10
       Comment: Yes.
   8. Did I generate the cards properly using random number generation (assuming all cards are equally likely each time)? 
       Mark out of 10:10
       Comment: Yes.
   9. Did I output the cards correctly as 2, 3, 4, ... 9, 10, Jack, Queen, King? 
       Mark out of 10:10
       Comment: Yes.
   10. Did I report whether the user won or lost the game before the program finished? 
       Mark out of 10:10
       Comment: Yes.
   11. How well did I complete this self-assessment? 
       Mark out of 5:5
       Comment: I think I completed it well
   Total Mark out of 100 (Add all the previous marks):100
*/

// I wasn't  really clear whether they were supposed to (a) have unlimited attempts at getting four in a row to win or 
// (b) if they must get all for of the fist 4 guesses correct in order to win (or else they lose)... I went with case (a) 
// and the commented pieces of code are what i would put in to make it suit case (b).

import java.util.*;

public class HiLoCardGame {

	public static final int NUMBER_OF_CARDS = 13;
	public static final int CORRECT_ANSWERS_NEEDED = 4;
	//public static final int MAX_ATTEMPTS = 4;
	
	public static void main(String[] args) {
		
		int correctAnswerCounter = 0;
		int attemptCounter = 0;
		boolean gameFinished = false;
		
		Random random = new Random ();
		int firstCard = random.nextInt(NUMBER_OF_CARDS) + 1;
		String firstCardString = "";
		
		switch (firstCard) 
		{
		case 11 :
			firstCardString = "Jack";
			break;
		case 12 :
			firstCardString = "Queen";
			break;
		case 13 :
			firstCardString = "King";
			break;
		case 14 :
			firstCardString = "Ace";
			break;
		default :
			firstCardString = "" + firstCard;
		}
		
		Scanner scanner = new Scanner (System.in);
		System.out.println("The card is a " + firstCardString);
		
		while (!gameFinished)
		{
			int secondCard = random.nextInt(NUMBER_OF_CARDS) + 2;
			String secondCardString = "";
			
			switch (secondCard) 
			{
			case 11 :
				secondCardString = "Jack";
				break;
			case 12 :
				secondCardString = "Queen";
				break;
			case 13 :
				secondCardString = "King";
				break;
			case 14 :
				secondCardString = "Ace";
				break;
			default :
				secondCardString = "" + secondCard;
			}
			
			System.out.println("Do you think the next card will be higher, lower or equal?");
			System.out.println("Please answer with 'higher', 'lower' or 'equal'");
			scanner = new Scanner (System.in);
			
			if (scanner.hasNext("higher") || scanner.hasNext("lower") || scanner.hasNext("equal"))
			{
				if (scanner.hasNext("higher") && secondCard > firstCard )
				{
					System.out.println("The card is a " + secondCardString);
					correctAnswerCounter++;
				}
				else if (scanner.hasNext("lower") && secondCard < firstCard)
				{
					System.out.println("The card is a " + secondCardString);
					correctAnswerCounter++;
				}
				else if (scanner.hasNext("equal") && secondCard == firstCard)
				{
					System.out.println("The card is a " + secondCardString);
					correctAnswerCounter++;
				}
				else
				{
					System.out.println("The card is a " + secondCardString);
					correctAnswerCounter = 0;
					//gameFinished = true;
				}
				if (correctAnswerCounter == CORRECT_ANSWERS_NEEDED /*|| attemptCounter == MAX_ATTEMPTS*/)
				{
					gameFinished = true;
				}
				firstCard = secondCard;
				attemptCounter++;
			}
			else
			{
				System.out.println("That is not a valid input");
			}
			
		}
		
		if (attemptCounter == CORRECT_ANSWERS_NEEDED)
		{
			System.out.println("Congratulations. You got them all correct.");
		}
		/*else
		{
			System.out.println("You lose!");
		}*/
		else 
		{
			System.out.println("Congratulations, you win! You got four in a row.");
		}
		scanner.close();
	}
}