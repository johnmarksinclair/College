import javax.swing.JOptionPane;
import java.util.*;

public class maxNumbers {

	public static void main(String[] args) {
		
		String userInput = JOptionPane.showInputDialog("Please input  list of numbers separated by spaces:");
		Scanner scanner = new Scanner(userInput);
		scanner.useDelimiter(" ");
		int minNumber = scanner.nextInt();
		int maxNumber = minNumber;
		
		while (scanner.hasNextInt())
		{
			int newNumber = scanner.nextInt();
			if (newNumber > maxNumber)
			{
				maxNumber = newNumber;
			}
			if (newNumber < minNumber)
			{
				minNumber = newNumber;
			}
		}
		System.out.print("Min = " + minNumber + " Max = " + maxNumber);
		scanner.close();
	}
}