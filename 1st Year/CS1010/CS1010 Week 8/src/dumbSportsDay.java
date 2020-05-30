import java.util.*;

public class dumbSportsDay {

	public static void main(String[] args) {
		
		int place = 1;
		int placeSuffix = 1;
		boolean primeNumber = false;
		String outputString = "";
		String outputSuffix = "";
		
		Scanner scanner = new Scanner (System.in);
		System.out.println("Please input the number of participants:");
		
		
		if (scanner.hasNextInt())
		{
			int participants = scanner.nextInt();
			
			if (participants > 0)
			{
				primeNumber = true;
				
				while (primeNumber = true && place <= participants)
				{
					
					if (place%10 == 1 && place != 11)
					{
						placeSuffix = 1;
					}
					else if (place%10 == 2 && place != 12)
					{
						placeSuffix = 2;
					}
					else if (place%10 == 3 && place != 13)
					{
						placeSuffix = 3;
					}
					else
					{
						placeSuffix = 0;
					}
					
					switch (placeSuffix)
					{
					case 1:
						outputSuffix = "st";
						break;
					case 2:
						outputSuffix = "nd";
						break;
					case 3:
						outputSuffix = "rd";
						break;
					default:
						outputSuffix = "th";
					}
					
					for (int divisor=2; ((divisor < place) && (primeNumber)); divisor++)
					{
						if (place%divisor == 0)
						{
							primeNumber = false;
						}
					}
					
					if (primeNumber == true)
					{
						String tempPlace = place + outputSuffix;
						outputString = outputString + ", " + tempPlace;
					}
					
					place++;
				}
				System.out.println("Prizes should be given to the competitors who came" + outputString + ".");
			}
			else
			{
				System.out.println("Please enter a valid integer number of participants");
			}
		}
		else
		{
			System.out.println("Please enter a valid integer number of participants");
		}
		scanner.close();
	}
}