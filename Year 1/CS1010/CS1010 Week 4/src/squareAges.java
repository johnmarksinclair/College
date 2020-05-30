/* SELF ASSESSMENT 
   1. Did I use appropriate CONSTANTS instead of numbers within the code?  
       Mark out of 5: 5
       Comment: Yes.
   2. Did I use easy-to-understand, meaningful CONSTANT names? 
       Mark out of 5: 5
       Comment: Yes.
   3. Did I format the CONSTANT names properly (in UPPERCASE)? 
       Mark out of 5: 5
       Comment: Yes.
   4. Did I use easy-to-understand meaningful variable names? 
       Mark out of 10: 10
       Comment: Yes.
   5. Did I format the variable names properly (in lowerCamelCase)? 
       Mark out of 10: 10
       Comment: Yes.
   6. Did I indent the code appropriately? 
       Mark out of 10: 10
       Comment: Yes.
   7. Did I use an appropriate for loop to test all possibilities?  There should be only one. 
       Mark out of 20: 20
       Comment: Yes.
   8. Did I correctly check if people alive today were or could be alive in a year that is the square of their age in that year. 
       Mark out of 30: 30
       Comment: Yes.
   9. How well did I complete this self-assessment? 
       Mark out of 5: 5
       Comment: I think I completed it well.
   Total Mark out of 100 (Add all the previous marks): 100
*/

public class squareAges {

	public static final int MAX_AGE = 123;
	public static final int MIN_AGE = 1;
	public static final int CURRENT_YEAR = 2018;
	public static final int MAX_YEAR = CURRENT_YEAR + MAX_AGE;
	public static final int MIN_YEAR = CURRENT_YEAR - MAX_AGE;

	public static void main(String[] args) {
		int age = 0;
		for (age = 1; (age <= MAX_AGE); age++) 
		{
			int ageSquared = age * age;
			int ageIn2018 = age - (ageSquared - CURRENT_YEAR);
			if (ageSquared <= MAX_YEAR && ageSquared >= MIN_YEAR && ageIn2018 <= MAX_AGE && ageIn2018 >= MIN_AGE) 
			{
				System.out.println("If you are " + age + " in the year " + ageSquared + " (" + ageIn2018
														+ " in 2018), your age will be the square root of the year.");
			}
		}
	}
}