package week10;

public class Connect4Grid2DArray implements Connect4Grid {
	
	private final int NUMBER_OF_ROWS = 6;
	private final int NUMBER_OF_COLUMNS = 7;
	char[][] grid;

	public Connect4Grid2DArray() {
		grid = new char[NUMBER_OF_ROWS][NUMBER_OF_COLUMNS];
	}

	@Override
	public void emptyGrid() {
		for (int index = 0; index < NUMBER_OF_ROWS; index++) {
			for (int count = 0; count < NUMBER_OF_COLUMNS; count++) {
				this.grid[index][count] = ' ';
			}
		}
	}

	@Override
	public String toString() {
		String returnedString = "";
		returnedString += " 0 1 2 3 4 5 6\n";
		for (int index = 0; index < NUMBER_OF_ROWS; index++) {
			for (int count = 0; count < NUMBER_OF_COLUMNS; count++) {
				returnedString += "|" + this.grid[index][count];
			}
			returnedString += "|\n";
		}
		return returnedString;
	}

	@Override
	public boolean isValidColumn(int column) {
		if (column >= 0 && column <= 6 && !isColumnFull(column))
			return true;
		else
			return false;
	}

	@Override
	public boolean isColumnFull(int column) {
		if (this.grid[0][column] == ' ')
			return false;
		else
			return true;
	}

	@Override
	public void dropPiece(ConnectPlayer player, int column) {
		char playerPiece = player.getPiece();
		if (isValidColumn(column)) {
			int lastEmptyRow = 0;
			for (int index = 0; index < NUMBER_OF_ROWS; index++) {
				if (this.grid[index][column] == ' ') {
					lastEmptyRow = index;
				}
			}
			this.grid[lastEmptyRow][column] = playerPiece;
		}
	}

	@Override
	public boolean didLastPieceConnect4() {
		if (horizontalWin() || verticalWin() || forwardDiagonalWin() || backwardDiagonalWin())
			return true;
		else
			return false;
	}

	public boolean horizontalWin() {
		int inARow = 0;
		for (int index = 0; index < NUMBER_OF_ROWS; index++) {
			for (int count = 1; count < NUMBER_OF_COLUMNS; count++) {
				if (this.grid[index][count - 1] == this.grid[index][count] && this.grid[index][count] != ' ') {
					inARow++;
				} else {
					inARow = 0;
				}
				if (inARow == 3) {
					return true;
				}
			}
		}
		return false;
	}

	public boolean verticalWin() {
		int inARow = 0;
		for (int index = 0; index < NUMBER_OF_COLUMNS; index++) {
			for (int count = 1; count < NUMBER_OF_ROWS; count++) {
				if (this.grid[count - 1][index] == this.grid[count][index] && this.grid[count][index] != ' ') {
					inARow++;
				} else {
					inARow = 0;
				}
				if (inARow == 3) {
					return true;
				}
			}
		}
		return false;
	}

	public boolean forwardDiagonalWin() {
		for (int row = NUMBER_OF_ROWS-1; row >= 3; row--) {
			for (int column = 0; column <= 3; column++) {
				if (this.grid[row][column] == this.grid[row - 1][column + 1] && this.grid[row][column] != ' ') {
					if (this.grid[row - 1][column + 1] == this.grid[row - 2][column + 2] && this.grid[row - 1][column + 1] != ' ') {
						if (this.grid[row - 2][column + 2] == this.grid[row - 3][column + 3] && this.grid[row - 2][column + 2] != ' ') {
							return true;
						}
					}
				}
			}
		}
		return false;
	}

	public boolean backwardDiagonalWin() {
		for (int row = NUMBER_OF_ROWS-1; row >= 3; row--) {
			for (int column = NUMBER_OF_COLUMNS-1; column >= 3; column--) {
				if (this.grid[row][column] == this.grid[row - 1][column - 1] && this.grid[row][column] != ' ') {
					if (this.grid[row - 1][column - 1] == this.grid[row - 2][column - 2] && this.grid[row - 1][column - 1] != ' ') {
						if (this.grid[row - 2][column - 2] == this.grid[row - 3][column - 3] && this.grid[row - 2][column - 2] != ' ') {
							return true;
						}
					}
				}
			}
		}
		return false;
	}

	@Override
	public boolean isGridFull() {
		for (int index = 0; index < NUMBER_OF_COLUMNS; index++) {
			if (!isColumnFull(index)) {
				return false;
			}
		}
		return true;
	}
}