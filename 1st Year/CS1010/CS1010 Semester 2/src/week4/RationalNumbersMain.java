/* SELF ASSESSMENT 

Class Rational 
I declared two member variables: numerator and denominator (marks out of 4: 4).
Comment: I declared two member variables: numerator and denominator

Constructor 1 
My program takes take two integers as parameters (for numerator and denominator) and initialises the member variables with the corresponding values . 
If the denominator is equal to 0 I throw an exception (marks out of 5: 5).
Comment: My program takes take two integers as parameters (for numerator and denominator) and initialises the member variables with the corresponding values

Constructor 2 
My program takes only one integer as parameter (numerator), and set the numerator to this value . I set the denominator to 1 in this case, 
as the resulting rational number in this case is an integer (marks out of 3: 3).
Comment: My program takes only one integer as parameter (numerator), and set the numerator to this value . I set the denominator to 1 in this case, 
as the resulting rational number in this case is an integer

Add Method 
My program takes only a rational number as a parameter and returns a new rational number which has a numerator and denominator which the 
addition of the two objects - this and the parameter. My program does not overwrite any of the other two rational numbers (marks out of 8: 8).
Comment: My program takes only a rational number as a parameter and returns a new rational number which has a numerator and denominator which the 
addition of the two objects - this and the parameter. My program does not overwrite any of the other two rational numbers

Subtract Method 
I have implemented this the same as add method, except it implements subtraction (marks out of 8: 8).
Comment: I have implemented this the same as add method, except it implements subtraction

Multiply Method 
I have implemented this the same as add method, except it implements multiplication (marks out of 8: 8).
Comment: I have implemented this the same as add method, except it implements multiplication

Divide Method 
I have implemented this the same as add method, except it implements divide (marks out of 8: 8).
Comment: I have implemented this the same as add method, except it implements divide

Equals Method 
My program takes a rational number as a parameter and compares it to the reference object. I only use multiplication between numerators/denominators 
for the purpose of comparison, as integer division will lead to incorrect results. I return a boolean value ((marks out of 8: 8).
Comment: My program takes a rational number as a parameter and compares it to the reference object. I only use multiplication between numerators/denominators 
for the purpose of comparison, as integer division will lead to incorrect results. I return a boolean value

isLessThan 
My program takes a rational number as a parameter and compares it to the reference object. I only use multiplication as integer division will lead to 
incorrect results. I return a boolean value (marks out of 8: 8).
Comment: My program takes a rational number as a parameter and compares it to the reference object. I only use multiplication as integer division will lead to 
incorrect results. I return a boolean value

Simplify Method 
My program returns a rational number but not a new rational number, instead it returns the current reference which is this. It doesn't take any 
parameters as it works only with the reference object. I first find the greatest common divisor (GCD) between the numerator and denominator, and then 
obtain the new numerator and denominator by dividing to the GCD (marks out of 8: 8).
Comment: My program returns a rational number but not a new rational number, instead it returns the current reference which is this. It doesn't take any 
parameters as it works only with the reference object. I first find the greatest common divisor (GCD) between the numerator and denominator, and then 
obtain the new numerator and denominator by dividing to the GCD

GCD function 
My program returns the greatest common divider of two integers: the numerator and the denominator (marks out of 6: 6).
Comment: My program returns the greatest common divider of two integers: the numerator and the denominator

toString Method 
My program returns a string showing the fraction representation of the number, e.g. "1/2". It takes no parameters (marks out of 4: 4).
Comment: My program returns a string showing the fraction representation of the number, e.g. "1/2". It takes no parameters

Test Client Class 
My program asks the user for two rational numbers, creates two rational objects using the constructor and passing in the provided values, calls addition, 
subtraction, multiplication, division, comparison and simplification and prints out the results (marks out of 22: 22).
Comment: My program asks the user for two rational numbers, creates two rational objects using the constructor and passing in the provided values, calls addition, 
subtraction, multiplication, division, comparison and simplification and prints out the results
*/

package week4;

import java.util.*;

public class RationalNumbersMain {

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		int numerOne = 0, numerTwo = 0, denomOne = 1, denomTwo = 1;
		System.out.print("Please enter numerator no.1: ");
		numerOne = scanner.nextInt();
		System.out.print("Please enter denominator no.1: ");
		denomOne = scanner.nextInt();
		System.out.print("Please enter numerator no.2: ");
		numerTwo = scanner.nextInt();
		System.out.print("Please enter denominator no.2: ");
		denomTwo = scanner.nextInt();
		Rational rationalOne = new Rational(numerOne, denomOne);
		Rational rationalTwo = new Rational(numerTwo, denomTwo);
		scanner.close();

		// testing add
		Rational tester = rationalOne.add(rationalTwo);
		System.out.println(rationalOne.toString() + " + " + rationalTwo.toString() + " = " + tester.toString());

		// testing subtract
		tester = rationalOne.subtract(rationalTwo);
		System.out.println(rationalOne.toString() + " - " + rationalTwo.toString() + " = " + tester.toString());

		// testing multiply
		tester = rationalOne.multiply(rationalTwo);
		System.out.println(rationalOne.toString() + " * " + rationalTwo.toString() + " = " + tester.toString());

		// testing divide
		tester = rationalOne.divide(rationalTwo);
		System.out.println(rationalOne.toString() + " / " + rationalTwo.toString() + " = " + tester.toString());

		// testing compare
		if (rationalOne.equals(rationalTwo))
			System.out.println(rationalOne.toString() + " == " + rationalTwo.toString());
		else if (rationalOne.isLessThan(rationalTwo))
			System.out.println(rationalOne.toString() + " < " + rationalTwo.toString());
		else
			System.out.println(rationalOne.toString() + " > " + rationalTwo.toString());

		// testing GCD
		System.out.println("Greatest Common Divisor of " + rationalOne.toString() + ": " + rationalOne.gcd());

		// testing simplify
		System.out.println("Rational One pre simplify: " + rationalOne.toString());
		rationalOne.simplify();
		System.out.println("Rational One post simplify: " + rationalOne.toString());
	}
}