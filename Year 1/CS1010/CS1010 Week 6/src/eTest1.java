import java.util.*;

public class eTest1 {

	public static void main(String[] args) {
		
		System.out.print("Please enter a positive whole number:");
		Scanner scanner = new Scanner (System.in);
		int number = scanner.nextInt();
		int divisor = 1;
		int quotient = 2;
		String factorPair = "";
		String factorsString = "The factors of " + number + " are";
		boolean primeNumber = true;
		
		while (divisor < (number/2) && quotient > divisor)
		{
			if (number%divisor == 0)
			{
				quotient = number/divisor;
				factorPair = divisor + "x" + quotient;
				factorsString = factorsString + ", " + factorPair;
			}
			divisor++;
		}
		System.out.println(factorsString + ".");
		
		for (divisor=2; ((divisor < number) && (primeNumber)); divisor++)
		{
			if (number%divisor == 0)
			{
				primeNumber = false;
			}
		}
		if (primeNumber)
		{
			System.out.println(number + " is a prime number.");
		}
		scanner.close();
	}
}