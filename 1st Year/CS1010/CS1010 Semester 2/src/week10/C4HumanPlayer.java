package week10;

public class C4HumanPlayer extends ConnectPlayer {
	
	public C4HumanPlayer(char piece) {
		super(piece);
	}
	
	@Override
	public void makeMove(Connect4Grid grid, int column) {
		grid.dropPiece(this, column);
	}
}