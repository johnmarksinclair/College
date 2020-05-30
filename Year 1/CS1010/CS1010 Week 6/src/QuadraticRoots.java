import javax.swing.JOptionPane;
import java.util.*;

public class QuadraticRoots {

	public static void main(String[] args) {
		
		boolean quit = false;
		int a = 0;
		int b = 0;
		int c = 0;
		//boolean error = false;
		
		try
		{
			do
			{
				String userInput = JOptionPane.showInputDialog("Enter the coefficients "
						+ "of your second order polynomial separated by spaces (or enter 'quit')");
				Scanner scanner = new Scanner(userInput);
				if (scanner.hasNext("exit"))
				{
					quit = true;
				}
				else if (scanner.hasNextInt())
				{
					scanner.useDelimiter(" ");
					a = scanner.nextInt();
					b = scanner.nextInt();
					c = scanner.nextInt();
					double squareRoot = Math.sqrt((b*b) - (4*a*c));
					double xPlus = (-b + squareRoot)/(2*a);
					double xMinus = (-b - squareRoot)/(2*a);
					JOptionPane.showMessageDialog(null, "x= " + xPlus + " and " + xMinus);
				}
				else if (scanner.hasNextInt() == false)
				{
					JOptionPane.showMessageDialog(null, "Please input a number");
				}
				scanner.close();
			} while (quit == false);
			JOptionPane.showMessageDialog(null, "Goodbye");
		}
		catch (Exception exception)
		{
			exception.printStackTrace();
			JOptionPane.showMessageDialog(null, "Goodbye");
		}
	}
}


/*
boolean errorChecked=false;
while(!errorChecked){
	try{
		//lots o code
		errorChecked = true;
	}catch(Exception e){
		//oops try again message
	}
}
}*/