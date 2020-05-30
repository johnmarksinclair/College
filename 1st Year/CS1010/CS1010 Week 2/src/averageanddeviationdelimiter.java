import java.util.Scanner;

import javax.swing.JOptionPane;
public class averageanddeviationdelimiter {
	public static void main (String [] args) {
		String input = JOptionPane.showInputDialog("Insert three numbers, separated by spaces");
		Scanner inputScanner = new Scanner(input);
		inputScanner.useDelimiter(" ");
		double numberOne = inputScanner.nextDouble();
		double numberTwo = inputScanner.nextDouble();
		double numberThree = inputScanner.nextDouble();
		double average = (numberOne + numberTwo + numberThree)/3;
		JOptionPane.showMessageDialog(null, "The average of these numbers is " + average + ".");
		double standardDeviation = Math.sqrt(((Math.pow(numberOne - average, 2.0)) + (Math.pow(numberTwo - average, 2.0)) 
				+ (Math.pow(numberThree - average, 2.0)))/3);
		JOptionPane.showMessageDialog(null, "The standard deviation of these numbers is " + standardDeviation + ".");
	}

}
