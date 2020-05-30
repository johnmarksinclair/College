/* SELF ASSESSMENT

Connect4Game class (35 marks)
My class creates references to the Connect 4 Grid and two Connect 4 Players. It asks the user whether 
he/she would like to play/quit inside a loop. If the user decides to play then: 1. Connect4Grid2DArray 
is created using the Connect4Grid interface, 2. the two players are initialised - must specify the type 
to be ConnectPlayer, and 3. the game starts. In the game, I ask the user where he/she would like to drop 
the piece. I perform checks by calling methods in the Connect4Grid interface. Finally a check is performed to determine a win. 
Comment:

Connect4Grid interface (10 marks)
I define all 7 methods within this interface.
Comment:

Connect4Grid2DArray class (25 marks) 
My class implements the Connect4Grid interface. It creates a grid using a 2D array Implementation of the 
method to check whether the column to drop the piece is valid. It provides as implementation of the method 
to check whether the column to drop the piece is full. It provides as implementation of the method to drop 
the piece.  It provides as implementation of the method to check whether there is a win.
Comment:

ConnectPlayer abstract class (10 marks)
My class provides at lest one non-abstract method and at least one abstract method. 
Comment:

C4HumanPlayer class (10 marks)
My class extends the ConnectPlayer claas and overrides the abstract method(s). It provides the Human player functionality.
Comment:

C4RandomAIPlayer class (10 marks)
My class extends the ConnectPlayer claas and overrides the abstract method(s). It provides AI player functionality. 
Comment:

Total Marks out of 100:

*/

package week10;

import java.util.*;

public class Connect4Game {

	public static void main(String[] args) {
		Connect4Grid2DArray grid = new Connect4Grid2DArray();
		boolean quit = false;
		Scanner scanner = new Scanner(System.in);
		while (!quit) {
			grid.emptyGrid();
			boolean finished = false;
			System.out.print("Would you like to play or quit? ");
			String choice = scanner.nextLine();
			if (choice.equals("play")) {
				System.out.print("How many players are there: ");
				int numberOfPlayers = scanner.nextInt();
				char winner = 'R';
				if (numberOfPlayers == 2) {
					ConnectPlayer playerOne = new C4HumanPlayer('R');
					ConnectPlayer playerTwo = new C4HumanPlayer('Y');
					System.out.print("\n" + grid.toString());
					boolean playerOnesTurn = true;
					while (!finished) {
						if (playerOnesTurn) {
							System.out.print("\nPlayer one select column: ");
							int column = scanner.nextInt();
							playerOne.makeMove(grid, column);
							playerOnesTurn = false;
							winner = playerOne.getPiece();
						} else {
							System.out.print("\nPlayer two select column: ");
							int column = scanner.nextInt();
							playerTwo.makeMove(grid, column);
							playerOnesTurn = true;
							winner = playerTwo.getPiece();
						}
						System.out.print("\n" + grid.toString());
						if (grid.isGridFull() || grid.didLastPieceConnect4()) {
							finished = true;
						}
					}
				} else if (numberOfPlayers == 1) {
					ConnectPlayer playerOne = new C4HumanPlayer('R');
					ConnectPlayer playerTwo = new C4RandomAIPlayer('Y');
					System.out.print("\n" + grid.toString());
					boolean playerOnesTurn = true;
					while (!finished) {
						if (playerOnesTurn) {
							System.out.print("\nSelect column: ");
							int column = scanner.nextInt();
							playerOne.makeMove(grid, column);
							playerOnesTurn = false;
							winner = playerOne.getPiece();
						} else {
							playerTwo.makeMove(grid, 0);
							playerOnesTurn = true;
							winner = playerTwo.getPiece();
						}
						System.out.print("\n" + grid.toString());
						if (grid.isGridFull() || grid.didLastPieceConnect4()) {
							finished = true;
						}
					}
				}
				System.out.print("\nThe winner is " + winner + "\n");
			} else if (choice.equals("quit")) {
				quit = true;
			}
		}
		scanner.close();
	}
}