/* SELF ASSESSMENT  
  
   1.  clearBoard:
   
	Did I use the correct method definition?
	Mark out of 5: 5 
	Comment: Yes my function has no return (it is void)
	Did I use loops to set each position to the BLANK character?
	Mark out of 5: 5
	Comment: Yes, I used a nested loop to set each position to BLANK

   2.  printBoard
   
	Did I use the correct method definition?
	Mark out of 5: 5
	Comment: Yes my function has no return (it is void)
	Did I loop through the array and prints out the board in a way that it looked like a board?
	Mark out of 5: 5
	Comment: Yes, I think so, I added markers along the side so the board was easier to visualise

   3.  canMakeMove
   
	Did I have the correct function definition and returned the correct item?
	Mark out of 5: 5
	Comment: Yes, this function returns true or false depending on whether a piece can be placed at a passed location
	Did I check if a specified location was BLANK?
	Mark out of 5: 5
	Comment: Yes, my function checks if the passed location has a BLANK in it, if so, the function returns true

   4.  makeMove
   
	Did I have the correct function definition?
	Mark out of 5: 5
	Comment: Yes, the function returns nothing
	Did I set the currentPlayerPiece in the specified location?
	Mark out of 5: 5
	Comment: Yes

   5.  isBoardFull
   
	Did I have the correct function definition and returned the correct item?
	Mark out of 5: 5
	Comment: Yes, this function returns true or false depending on whether the board has any BLANK chars or not
	Did I loop through the board to check if there are any BLANK characters?
	Mark out of 5: 5
	Comment: Yes, I used a nested loop to do this

   6.  winner
   
	Did I have the correct function definition and returned the winning character
	Mark out of 5: 5
	Comment: Yes, and if no one has won it returns the BLANK char
	Did I identify all possible horizontal, vertical and diagonal winners  
	Mark out of 15: 15
	Comment: Yes, it takes into account all three rows and columns and the two possible diagonal winning combinations

   7.main

	Did I create a board of size 3 by 3 and use the clearBoard method to set all the positions to the BLANK character ('  ')?
	Mark out of 3: 3
	Comments: Yes I created a 3x3 char array and set all the positions to BLANK using the clearBoard method
	Did I loop asking the user for a location until wither the board was full or there was a winner?
	Mark out of 5: 5
	Comments: Yes, my program repeated asks for a position to place a piece until there is a winner or the board is full
	Did I call all of the methods above?
	Mark out of 5: 5
	Comments: Yes, all methods are called in my main
	Did I handle incorrect locations provided by the user (either occupied or invalid locations)?
	Mark out of 3: 3
	Comments: Yes, I used an if statement to make sure the input was an integer between 0-2 and checked using canMakeMove
	 																whether the space was occupied
	Did I switch the current player piece from cross to nought and vice versa after every valid move?
	Mark out of 3: 3
	Comments: Yes, it only moves onto the next player if the previous has made a valid move
	Did I display the winning player piece or a draw at the end of the game?
	Mark out of 3: 3
	Comments: Yes, it say whether X or O has won or if there was a draw

   8.  Overall
   
	Is my code indented correctly?
	Mark out of 3: 3
	Comments: Yes
	Do my variable names and Constants (at least four of them) make sense?
	Mark out of 3: 3
	Comments: Yes, I think they all describe themselves aptly
	Do my variable names, method names and class name follow the Java coding standard
	Mark out of 2: 2
	Comments: Yes, LCC for function and variable names and UCC for the class name

      Total Mark out of 100 (Add all the previous marks): 100
*/

package week2;

import java.util.*;

public class NoughtsAndCrosses {
	
	public static final char NOUGHT = 'O';
	public static final char CROSS = 'X';
	public static final char BLANK = ' ';
	public static final int NUMBER_OF_ROWS_AND_COLUMNS = 3;

	public static void main(String[] args)
	{
		boolean finished = false;
		char piece = CROSS;
		char tempPiece = NOUGHT;
		char otherTempPiece = NOUGHT;
		char[][] board = new char[NUMBER_OF_ROWS_AND_COLUMNS][NUMBER_OF_ROWS_AND_COLUMNS];
		clearBoard(board);
		while (!finished)
		{
			printBoard(board);
			Scanner scanner = new Scanner(System.in);
			System.out.println("\nEnter the row then the column separated by spaces:\n");
			if (scanner.hasNextInt())
			{
				int row = scanner.nextInt();
				if (scanner.hasNextInt())
				{
					int column = scanner.nextInt();
					if (row < NUMBER_OF_ROWS_AND_COLUMNS && row >= 0 && column < NUMBER_OF_ROWS_AND_COLUMNS && column >= 0)
					{
						if (canMakeMove(board, row, column))
						{
							makeMove(board, piece, row, column);
							otherTempPiece = piece;
							piece = tempPiece;
							tempPiece = otherTempPiece;
						}
						else
							System.out.println("\nThat spot is taken! Pick another...");
						if (isBoardFull(board))
							finished = true;
						else if (winner(board) != BLANK)
							finished = true;
					}
					else
						System.out.println("\nThats not a valid choice, try a number between 0 and 2");
				}
				else
					System.out.println("\nThats not a valid input, please input an integer");
			}
			else
				System.out.println("\nThats not a valid input, please input an integer");
		}
		printBoard(board);
		if (winner(board) == CROSS)
			System.out.println("\nX wins!");
		else if (winner(board) == NOUGHT)
			System.out.println("\nO wins!");
		else
			System.out.println("\nIt's a draw!");
		System.exit(0);
	}
	
	public static void clearBoard(char[][] board)
	{
		for (int row = 0; row < NUMBER_OF_ROWS_AND_COLUMNS; row++)
		{
			for (int column = 0; column < NUMBER_OF_ROWS_AND_COLUMNS; column++)
			{
				board[row][column] = BLANK;
			}
		}
	}
	
	public static void printBoard(char[][] board)
	{
		System.out.print("\n  |0|1|2|");
		for (int row = 0; row < NUMBER_OF_ROWS_AND_COLUMNS; row++)
		{
			System.out.println("");
			System.out.print("|" + row + "|");
			for (int column = 0; column < NUMBER_OF_ROWS_AND_COLUMNS; column++)
			{
				if (column == 2)
					System.out.print(board[row][column]);
				else
					System.out.print(board[row][column] + "|");
			}
			System.out.print("|");
		}
		System.out.println("");
	}
	
	public static boolean canMakeMove(char[][] board, int row, int column)
	{
		boolean canMakeMove = false;
		if (board[row][column] == BLANK)
			canMakeMove = true;
		return canMakeMove;
	}
	
	public static void makeMove(char[][] board, char currentPlayerPiece, int row, int column)
	{
		board[row][column] = currentPlayerPiece;
	}
	
	public static boolean isBoardFull(char[][] board)
	{
		boolean isBoardFull = true;
		for (int row = 0; row < NUMBER_OF_ROWS_AND_COLUMNS; row++)
		{
			for (int column = 0; column < NUMBER_OF_ROWS_AND_COLUMNS; column++)
			{
				if (board[row][column] == BLANK)
					isBoardFull = false;
			}
		}
		return isBoardFull;
	}
	
	public static char winner(char[][] board)
	{
		char winningChar = BLANK;
		if (board[0][0] == board[1][1] && board[1][1] == board[2][2])
			winningChar = board[0][0];
		if (board[0][2] == board[1][1] && board[1][1] == board[2][0])
			winningChar = board[0][2];
		for (int index = 0; index < NUMBER_OF_ROWS_AND_COLUMNS; index++)
		{
			if (board[index][0] == board[index][1] && board[index][1] == board[index][2])
				winningChar = board[index][0];
		}
		for (int count = 0; count < NUMBER_OF_ROWS_AND_COLUMNS; count++)
		{
			if (board[0][count] == board[1][count] && board[1][count] == board[2][count])
				winningChar = board[0][count];
		}
		return winningChar;
	}
}