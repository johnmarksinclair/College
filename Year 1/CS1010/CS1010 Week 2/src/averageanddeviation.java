import java.util.Scanner;

import javax.swing.JOptionPane;
public class averageanddeviation {
	public static void main (String [] args) {
		String inputOne = JOptionPane.showInputDialog("What is your first number?");
		Scanner inputScanner = new Scanner(inputOne);
		double numberOne = inputScanner.nextDouble();
		String inputTwo = JOptionPane.showInputDialog("What is your second number?");
		inputScanner = new Scanner(inputTwo);
		double numberTwo = inputScanner.nextDouble();
		String inputThree = JOptionPane.showInputDialog("What is your third number?");
		inputScanner = new Scanner(inputThree);
		double numberThree = inputScanner.nextDouble();
		double average = (numberOne + numberTwo + numberThree)/3;
		JOptionPane.showMessageDialog(null, "The average of these numbers is " + average + ".");
		double standardDeviation = Math.sqrt(((Math.pow(numberOne - average, 2.0)) + (Math.pow(numberTwo - average, 2.0)) 
				+ (Math.pow(numberThree - average, 2.0)))/3);
		JOptionPane.showMessageDialog(null, "The standard deviation of these numbers is " + standardDeviation + ".");
	}
}