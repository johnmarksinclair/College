package week10;
import java.util.*;

public class C4RandomAIPlayer extends ConnectPlayer {
	
	public C4RandomAIPlayer(char piece) {
		super(piece);
	}
	
	@Override
	public void makeMove(Connect4Grid grid, int column) {
		Random random = new Random();
		int randomNumber = random.nextInt(6);
		grid.dropPiece(this,  randomNumber);
	}
}