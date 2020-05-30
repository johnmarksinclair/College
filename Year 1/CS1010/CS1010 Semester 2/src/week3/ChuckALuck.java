/* SELF ASSESSMENT 
	1. ResolveBet

		I have correctly defined ResolveBet which takes the bet type (String) and the Wallet object, and a void return type [Mark out of 7: 7].
		Comment: Yes, my function takes in a bet type in the form of a string as well as the wallet object. The function doesn't return anything (void)
		My program presents the amount of cash in the wallet and asks the user how much he/she would like to bet [Mark out of 8: 8].
		Comment: Yes, using wallet.check() my program gets the balance of the player and displays it before they choose how much to bet
		My program ensures the bet amount is not greater than the cash in the wallet [Mark out of 5: 5].
		Comment: Yes it does so using an if statement which checks that the bet amount <= the balance in the wallet. If it is greater it displays a message saying so
		My program creates three Dice objects, rolls them and creates a total variable with a summation of the roll values returned [Mark out of 15: 15].
		Comment: Yes it creates three dice objects; diceOne, diceTwo and diceThree, rolls them and then adds them for use in determining whether the player has won
		My program determines the winnings by comparing the bet type with the total and comparing the bet type with the dice faces for the triple bet [Mark out of 20: 20].
		Comment: Yes, my program compares the bet type to the total of the top faces as well as the individual dice faces to determine if the player has won
		My program outputs the results (win or loss) and adds the winnings to the wallet if user wins or removes the bet amount from the wallet if the user loses [Mark out of 10: 10].
		Comment: Yes, when a bet is placed the stake is removed from the wallet, if the player wins the stake + the winnings is put back into the wallet 

	2. Main

		I ask the user for the amount of cash he/she has, create a Wallet object and put this cash into it [Mark out of 15: 15]
		Comment: Yes, i ask how much they'd like to play with, if the input is appropriate i then create a wallet object and put the desired funds into it
		My program loops continuously until the user either enters quit or the cash in the wallet is 0 [Mark out of 5: 5]
		Comment: Yes, the game keeps going until the user is out of money or they enter 'quit'
		I ask the user to enter any of the four bet types or quit [Mark out of 5: 5].
		Comment: Yes, i display what their options are and get them to enter 1, 2, 3 or 4 depending on their  choice
		My program calls resolveBet for each bet type entered [Mark out of 5: 5].
		Comment: Yes, it makes sure the input is valid then calls the resolveBet function each time
		At the end of the game my program presents a summary message regarding winnings and losses [Mark out of 5: 5]
		Comment: Yes, my message states what they started off with and what they finished with

	 Total Mark out of 100 (Add all the previous marks): 100
*/

package week3;

import java.util.*;

public class ChuckALuck {
	
	public static void main(String[] args) {
		System.out.print("Hello, how much cash do you have to play with? ");
		Scanner scanner = new Scanner(System.in);
		if (scanner.hasNextDouble()) {
			double funds = scanner.nextDouble();
			if (funds > 0) {
				Wallet wallet = new Wallet();
				wallet.put(funds);
				boolean finished = false;
				while (!finished) {
					Scanner scannerTwo = new Scanner(System.in);
					System.out.println("\nWhat bet type would you like to place? (use numbers!)");
					System.out.println("1 - Triple\n2 - Field\n3 - High\n4 - Low\nor type 'quit'\n");
					String betType = "";
					if (scannerTwo.hasNext("quit")) {
						finished = true;
					}
					else if (scannerTwo.hasNext("1")) {
						betType = "Triple";
						resolveBet(betType, wallet);
					}
					else if (scannerTwo.hasNext("2")) {
						betType = "Field";
						resolveBet(betType, wallet);
					}
					else if (scannerTwo.hasNext("3")) {
						betType = "High";
						resolveBet(betType, wallet);
					}
					else if (scannerTwo.hasNext("4")) {
						betType = "Low";
						resolveBet(betType, wallet);
					}
					else 
						System.out.println("\nThat is not a valid choice, try again");
					if (wallet.check() == 0) {
						finished = true;
						System.out.println("\nOh no you're out of money!");
					}
				}
				System.out.println("\nYou started off with €" + funds + " and you now have €" + wallet.check());
			}
			else
				System.out.println("\nThat is not a valid input, you must have more than €0 to play!");
		}
		else 
			System.out.println("\nThat is not a valid input");
	}
	
	public static void resolveBet(String betType, Wallet wallet) {
		System.out.print("\nYou have €" + wallet.check() + " in your wallet, how much would you like to bet?: ");
		Scanner scanner = new Scanner(System.in);
		if (scanner.hasNextDouble()) {
			double betAmount = scanner.nextDouble();
			if (betAmount > 0 && betAmount <= wallet.check()) {
				wallet.get(betAmount);
				boolean hasWon = false;
				Dice diceOne = new Dice();
				Dice diceTwo = new Dice();
				Dice diceThree = new Dice();
				diceOne.roll();
				diceTwo.roll();
				diceThree.roll();
				int diceOneResult = diceOne.topFace();
				int diceTwoResult = diceTwo.topFace();
				int diceThreeResult = diceThree.topFace();
				int totalOfThreeDice = diceOneResult + diceTwoResult + diceThreeResult;
				boolean isTriple = false;
				if (diceOneResult == diceTwoResult && diceTwoResult == diceThreeResult) {
					isTriple = true;
				}
				System.out.println("\nDice One: " + diceOneResult + "\nDice Two: " + diceTwoResult + "\nDice Three: " + diceThreeResult);
				System.out.println("Total: " + totalOfThreeDice);
				if (betType.equals("Triple")) {
					if (isTriple && !(diceOneResult == 1 || diceOneResult == 6)) {
						hasWon = true;
						wallet.put(betAmount*31);
					}
				}
				if (betType.equals("Field")) {
					if (totalOfThreeDice < 8 || totalOfThreeDice > 12) {
						hasWon = true;
						wallet.put(betAmount*2);
					}
				}
				if (betType.equals("High")) {
					if (totalOfThreeDice > 10 && !isTriple) {
						hasWon = true;
						wallet.put(betAmount*2);
					}
				}
				if (betType.equals("Low")) {
					if (totalOfThreeDice < 11 && !isTriple) {
						hasWon = true;
						wallet.put(betAmount*2);
					}
				}
				if (hasWon)
					System.out.println("\nYou won!");
				else
					System.out.println("\nYou lost!");
			} 
			else
				System.out.println("\nThat bet is larger than what you have in your wallet!");
		}
		else
			System.out.println("\nThat is not a valid input");
	}
}