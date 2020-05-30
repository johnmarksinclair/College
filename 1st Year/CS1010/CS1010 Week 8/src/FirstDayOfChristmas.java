/* SELF ASSESSMENT 
   1. Did I use appropriate CONSTANTS instead of numbers within the code? 
       Mark out of 5: 5
       Comment: Yes.
   2. Did I use easy-to-understand, meaningful CONSTANT names formatted correctly in UPPERCASE? 
       Mark out of 5: 5
       Comment: Yes.
   3. Did I use easy-to-understand meaningful variable names formatted properly (in lowerCamelCase)? 
       Mark out of 10: 10
       Comment: Yes.
   4. Did I indent the code appropriately? 
       Mark out of 10: 10
       Comment: Yes.
   5. Did I use an appropriate loop (or loops) to produce the different verses? 
       Mark out of 20: 20
       Comment: Yes.
   6. Did I use a switch to build up the verses? 
       Mark out of 25: 25
       Comment: Yes.
   7. Did I avoid duplication of code and of the lines which make up the verses (each line should be referred to in the code only once (or twice))? 
       Mark out of 10: 10
       Comment: Yes.
   8. Does the program produce the correct output? 
       Mark out of 10: 10 
       Comment: Yes.
   9. How well did I complete this self-assessment? 
       Mark out of 5: 5
       Comment: I think I completed it well.
   Total Mark out of 100 (Add all the previous marks): 100
*/

public class FirstDayOfChristmas {
	
	public static String SECOND_LINE = "Two Turtle Doves\n";
	public static String THIRD_LINE = "Three French Hens\n";
	public static String FORTH_LINE = "Four Calling Birds\n";
	public static String FIFTH_LINE = "Five Golden Rings\n";
	public static String SIXTH_LINE = "Six Geese a Laying\n";
	public static String SEVENTH_LINE = "Seven Swans a Swimming\n";
	public static String EIGHTH_LINE = "Eight Maids a Milking\n";
	public static String NINTH_LINE = "Nine Ladies Dancing\n";
	public static String TENTH_LINE = "Ten Lords a Leaping\n";
	public static String ELEVENTH_LINE = "Eleven Pipers Piping\n";
	public static String TWELFTH_LINE = "Twelve Drummers Drumming\n";
	public static String PARTRIDGE_LINE = "Partridge in a Pear Tree\n";

	public static void main(String[] args) {
		
		String verse = "";
		String day = "";
		String partridgePrefix = "";
		int loop = 1;
		
		while (loop <= 12)
		{
			partridgePrefix = (loop == 1 ? "A " : "and a ");
			
			switch (loop)
			{
			case 1:
				day = "first";
				verse = partridgePrefix + PARTRIDGE_LINE;
				break;
			case 2:
				day = "second";
				verse = SECOND_LINE + partridgePrefix + PARTRIDGE_LINE;
				break;
			case 3:
				day = "third";
				verse = THIRD_LINE + verse;
				break;
			case 4:
				day = "forth";
				verse = FORTH_LINE + verse;
				break;
			case 5:
				day = "fifth";
				verse = FIFTH_LINE + verse;
				break;
			case 6:
				day = "sixth";
				verse = SIXTH_LINE + verse;
				break;
			case 7:
				day = "seventh";
				verse = SEVENTH_LINE + verse;
				break;
			case 8:
				day = "eight";
				verse = EIGHTH_LINE + verse;
				break;
			case 9:
				day = "ninth";
				verse = NINTH_LINE + verse;
				break;
			case 10:
				day = "tenth";
				verse = TENTH_LINE + verse;
				break;
			case 11:
				day = "eleventh";
				verse = ELEVENTH_LINE + verse;
				break;
			case 12:
				day = "twelfth";
				verse = TWELFTH_LINE + verse;
				break;
			default:
				day = "";
			}
			loop++;
			System.out.println("On the " + day + " of Christmas my true love gave to me:");
			System.out.println(verse);
		}
	}
}