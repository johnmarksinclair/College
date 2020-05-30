package week10;

public abstract class ConnectPlayer{
	private char piece;
	
	public ConnectPlayer(char piece) {
		this.piece = piece;
	}
	
	public abstract void makeMove(Connect4Grid grid, int column);
	
	public char getPiece() {
		return piece;
	}
}