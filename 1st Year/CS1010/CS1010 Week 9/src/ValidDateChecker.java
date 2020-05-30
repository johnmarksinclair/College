import java.util.Scanner;

public class ValidDateChecker {

	public static void main(String[] args) 
	{
		System.out.println("Please enter the date separated by spaces (day month year)");
		Scanner scanner = new Scanner (System.in);
		int day = scanner.nextInt();
		int month = scanner.nextInt();
		int year = scanner.nextInt();
		if (isValidDate(day, month, year))
		{
			System.out.println("This is a valid date");
		}
		else
		{
			System.out.println("This is not a valid date");
		}
		scanner.close();
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