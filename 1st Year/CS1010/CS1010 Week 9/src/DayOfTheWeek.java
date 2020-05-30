/* SELF ASSESSMENT

 1. Did I use appropriate, easy-to-understand, meaningful CONSTANT names formatted correctly in UPPERCASE?

        Mark out of 5: 5
        Comment: Yes.

 2. Did I use easy-to-understand meaningful variable names formatted properly (in lowerCamelCase)?

        Mark out of 5: 5
        Comment: Yes.

 3. Did I indent the code appropriately?

        Mark out of 5: 5
        Comment: Yes.

 4. Did I define the required function correctly (names, parameters & return type) and invoke them correctly?

       Mark out of 20: 20
        Comment: Yes.  

 5. Did I implement the dayOfTheWeek function correctly and in a manner that can be understood?

       Mark out of 20: 20
        Comment: Yes.  

 6. Did I implement the other functions correctly, giving credit for any code that you take from elsewhere?

       Mark out of 20: 20
        Comment: Yes.  

 7. Did I obtain (and process) the input from the user in the correct format (dd/mm/yyyy), and deal with any invalid input properly?       
      Mark out of 10: 10
        Comment: Yes.

 8. Does the program produce the output in the correct format (e.g. Monday, 25th December 2017)?

       Mark out of 10: 10
        Comment: Yes.  

 9. How well did I complete this self-assessment?

        Mark out of 5: 5
        Comment: I think I completed it well.

 Total Mark out of 100 (Add all the previous marks):

*/ 

import java.util.Scanner;
import javax.swing.JOptionPane;

public class DayOfTheWeek {

	public static String FIRST_DAY = "Sunday";
	public static String SECOND_DAY = "Monday";
	public static String THIRD_DAY = "Tuesday";
	public static String FORTH_DAY = "Wednesday";
	public static String FIFTH_DAY = "Thursday";
	public static String SIXTH_DAY = "Friday";
	public static String SEVENTH_DAY = "Saturday";
	public static int DAYS_IN_A_WEEK = 7;
	
	public static void main(String[] args) 
	{
		try
		{
			String userInputtedDate = JOptionPane.showInputDialog("Please input a date in the format day/month/year");
			Scanner scanner = new Scanner (userInputtedDate);
			scanner.useDelimiter("/");
			if (scanner.hasNextInt())
			{
				int day = scanner.nextInt();
				int month = scanner.nextInt();
				int year = scanner.nextInt();
				scanner.close();
				
				if (isValidDate(day, month, year))
				{
					JOptionPane.showMessageDialog(null, getDayOfTheWeek(day, month, year) + ", " + 
												day + getNumberEnding(day) + " " + getMonthName(month) + " " + year);
				}
				else
				{
					JOptionPane.showMessageDialog(null, "This is not a valid date");
				}
			}
			else
			{
				JOptionPane.showMessageDialog(null, "No date was entered");
			}
		}
		catch (Exception NullPointerException)
		{
			JOptionPane.showMessageDialog(null, "Bye");
			//NullPointerException.printStackTrace();
		}
	}
	
	public static String getNumberEnding(int day)
	{
		String numberEndingString = "";
		int dayType =0;
		
		if (day%10 == 1 && day != 11)
		{
			dayType = 1;
		}
		else if (day%10 == 2 && day != 12)
		{
			dayType = 2;
		}
		else if (day%10 == 3 && day != 13)
		{
			dayType = 3;
		}
		else
		{
			dayType = 4;
		}
		
		switch (dayType)
		{
		case 1:
			numberEndingString = "st";
			break;
		case 2:
			numberEndingString = "nd";
			break;
		case 3:
			numberEndingString = "rd";
			break;
		case 4:
			numberEndingString = "th";
			break;
		}
		return numberEndingString;
	}
	
	public static String getMonthName(int month)
	{
		String monthString = "";
		switch (month)
		{
		case 1 :
			monthString = "January";
			break;
		case 2 :
			monthString = "February";
			break;
		case 3 :
			monthString = "March";
			break;
		case 4 :
			monthString = "April";
			break;
		case 5 :
			monthString = "May";
			break;
		case 6 :
			monthString = "June";
			break;
		case 7 :
			monthString = "July";
			break;
		case 8 :
			monthString = "August";
			break;
		case 9 :
			monthString = "September";
			break;
		case 10 :
			monthString = "October";
			break;
		case 11 :
			monthString = "November";
			break;
		case 12 :
			monthString = "December";
			break;
		}
		return monthString;
	}
	
	public static String getDayOfTheWeek(int day, int month, int year)
	{
		String dayString = "";
		int Y = 0;
		switch (month)
		{
		case 1:
		case 2:
			Y = year - 1;
			break;
		default:
			Y = year;
		}
		int lastTwoDigitsOfYear = Y%100;
		int firstTwoDigitsOfYear = Y/100;
		double algorithmResult = (day + Math.floor(2.6 * (((month + 9) % 12) + 1) - 0.2) + 
				lastTwoDigitsOfYear + Math.floor(lastTwoDigitsOfYear/4) + 
					Math.floor(firstTwoDigitsOfYear/4) - 2*firstTwoDigitsOfYear);
		int dayOfTheWeek = (int) Math.abs(algorithmResult)%DAYS_IN_A_WEEK;
		
		switch (dayOfTheWeek)
		{
		case 0:
			dayString = FIRST_DAY;
			break;
		case 1:
			dayString = SECOND_DAY;
			break;
		case 2:
			dayString = THIRD_DAY;
			break;
		case 3:
			dayString = FORTH_DAY;
			break;
		case 4:
			dayString = FIFTH_DAY;
			break;
		case 5:
			dayString = SIXTH_DAY;
			break;
		case 6:
			dayString = SEVENTH_DAY;
			break;
		}
		return dayString;
	}
	
	public static boolean isValidDate(int day, int month, int year)
	{
		if (0 <= day && day <= getDaysInMonth(month, year))
		{
			return true;
		}
		return false;
	}
	
	public static int getDaysInMonth(int month, int year)
	{
		int daysInMonth = 0;
		boolean isLeapYear = isLeapYear(year);
		if (isLeapYear)
		{
			switch (month)
			{
			case 2:
				daysInMonth = 29;
				break;
			case 4:
			case 6:
			case 9:
			case 11:
				daysInMonth = 30;
				break;
			default:
				daysInMonth = 31;
			}
		}
		else
		{
			switch (month)
			{
			case 2:
				daysInMonth = 28;
				break;
			case 4:
			case 6:
			case 9:
			case 11:
				daysInMonth = 30;
				break;
			default:
				daysInMonth = 31;
			}
		}
		return daysInMonth;
	}
	
	public static boolean isLeapYear(int year)
	{
		boolean isLeapYear = false;
		if (year%400 == 0 || year%4 == 0 && year/100 != 0)
		{
			isLeapYear = true;
		}
		return isLeapYear;
	}
}