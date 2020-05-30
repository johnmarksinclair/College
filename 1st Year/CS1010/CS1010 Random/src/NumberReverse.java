import java.util.*;
import javax.swing.JOptionPane;

public class NumberReverse {
	
	public static void main (String[] args) {
		
		String input = JOptionPane.showInputDialog("Input number to reverse:");
		Scanner scanner = new Scanner (input);
		if (scanner.hasNextInt())
		{
			int number = scanner.nextInt();
			scanner.close();
			
			if (number == JOptionPane.OK_OPTION)
			{
				int reversedNumber = 0;
				int remainingNumber = number;
				while (remainingNumber > 0)
				{
					reversedNumber = reversedNumber*10 + remainingNumber%10;
					remainingNumber = remainingNumber/10;
				}
				JOptionPane.showMessageDialog(null, "The reverse of " + number + " is " + reversedNumber + ".");
			}
			else if (number == JOptionPane.CANCEL_OPTION)
			{
				JOptionPane.showMessageDialog(null, "Invalid input");
			}
			else
			{
				JOptionPane.showMessageDialog(null, "Invalid input");
			}
		}
		else
		{
			JOptionPane.showMessageDialog(null, "Invalid input");
		}
	}
}