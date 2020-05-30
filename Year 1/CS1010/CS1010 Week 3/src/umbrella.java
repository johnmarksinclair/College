/* Write a program which determines if the user should bring an umbrella when they go 
   out (if it looks like it might rain or is raining) and if so whether they should put it up (if it is raining).

   SELF ASSESSMENT 
   1. Did I use easy-to-understand meaningful variable names? 
       Mark out of 10: 10
       Comment: Yes.
   2. Did I format the variable names properly (in lowerCamelCase)? 
       Mark out of 10: 10
       Comment: Yes.
   3. Did I indent the code appropriately? 
       Mark out of 10: 10
       Comment: Yes.
   4. Did I read the input correctly from the user using appropriate questions? 
       Mark out of 20: 20
       Comment: Yes.
   5. Did I use an appropriate (i.e. not more than necessary) series of if statements? 
       Mark out of 30: 30
       Comment: Yes.
   6. Did I output the correct answer for each possibility in an easy to read format? 
       Mark out of 15: 15
       Comment: Yes.
   7. How well did I complete this self-assessment? 
       Mark out of 5: 5
       Comment: I think I completed it well.
   Total Mark out of 100 (Add all the previous marks): 100
*/

import javax.swing.JOptionPane;

public class umbrella {
	
	public static final String QUESTION_1 = "Is it raining outside?";
	public static final String QUESTION_2 = "Does it look like it might rain today?";
	public static final String RAINING = "Bring an umbrella with you and put it up when you get outside!";
	public static final String MIGHT_RAIN = "Bring an umbrella with you and when it starts to rain, put it up!";
	public static final String NOT_NEEDED = "You won't need an umbrella today.";

	public static void main(String[] args) {

		int isItRainingAnswer = JOptionPane.showConfirmDialog(null, QUESTION_1);
		boolean raining = (isItRainingAnswer == JOptionPane.YES_OPTION);
		if (isItRainingAnswer == JOptionPane.YES_OPTION || isItRainingAnswer == JOptionPane.NO_OPTION)
		{
			if (raining == true) 
			{
				JOptionPane.showMessageDialog(null, RAINING);
			} 
			else if (raining == false) 
			{
				int maybeRainAnswer = JOptionPane.showConfirmDialog(null, QUESTION_2);
				boolean forcasted = (maybeRainAnswer == JOptionPane.YES_OPTION);
				if (maybeRainAnswer == JOptionPane.YES_OPTION || maybeRainAnswer == JOptionPane.NO_OPTION)
				{
					if (forcasted == true) 
					{
						JOptionPane.showMessageDialog(null, MIGHT_RAIN);
					} 
					else 
						JOptionPane.showMessageDialog(null, NOT_NEEDED);
				}
			}
		}
	}
}