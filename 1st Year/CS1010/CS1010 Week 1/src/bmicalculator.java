import java.util.Scanner;

import javax.swing.JOptionPane;

public class bmicalculator {
	public static void main (String [] args) {
		String weightMessage = JOptionPane.showInputDialog("What is your weight in kg?");
		Scanner inputScanner = new Scanner(weightMessage);
		double weight = inputScanner.nextDouble();
		String heightMessage = JOptionPane.showInputDialog("What is your height in m?");
		inputScanner = new Scanner(heightMessage);
		double height = inputScanner.nextDouble();
		double BMI = weight/(height*height);
		JOptionPane.showMessageDialog(null, "Your BMI is " + BMI);
	}
}