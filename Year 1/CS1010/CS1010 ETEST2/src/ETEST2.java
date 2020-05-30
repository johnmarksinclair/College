import java.util.*;
import javax.swing.JOptionPane;

public class ETEST2 {
	
	public static final double KILOGRAMS_IN_AN_OUNCE = 0.02834952;
	public static final double POUNDS_IN_A_STONE = 14;
	public static final double OUNCES_IN_A_POUND = 16;
	
	public static void main (String[] args)
	{
		boolean quit = false;
		try
		{
			while (!quit)
			{
				String userInputtedValues = JOptionPane.showInputDialog("Enter the number of Stones, Pounds and "
						+ "Ounces separated by spaces (or enter quit): ");
				Scanner scanner = new Scanner(userInputtedValues);
				scanner.useDelimiter(" ");
				if (scanner.hasNext("quit"))
				{
					quit = true;
				}
				else
				{
					double stones = scanner.nextDouble();
					double pounds = scanner.nextDouble();
					double ounces = scanner.nextDouble();
					scanner.close();

					double totalKilograms = convertToKilograms(stones, pounds, ounces);
					String formattedWeightString = getFormattedWeightString(stones, pounds, ounces, totalKilograms);

					JOptionPane.showMessageDialog(null, formattedWeightString);
				}
			}
		} catch (Exception InputMismatchException) 
		{
		};
	}
	
	public static double convertToKilograms(double stones, double pounds, double ounces)
	{
		double tempStones = stones;
		double tempPounds = pounds;
		double tempOunces = ounces;
		
		double totalPounds = tempPounds + (tempStones*POUNDS_IN_A_STONE);
		double totalOunces = tempOunces + (totalPounds*OUNCES_IN_A_POUND);
		
		double totalKilograms = totalOunces*KILOGRAMS_IN_AN_OUNCE;
		
		return totalKilograms;
	}
	
	public static String getFormattedWeightString(double stones, double pounds, double ounces, double totalKilograms)
	{
		String stonesString = "";
		String poundsString = "";
		String ouncesString = "";
		
		if (pounds == 0 && ounces == 0)
		{
			if (stones == 1)
			{
				stonesString = (int)stones + " stone ";
			}
			else if (stones != 0)
			{
				stonesString = (int)stones + " stones ";
			}
		}
		else
		{
			if (stones == 1)
			{
				stonesString = (int)stones + " stone, ";
			}
			else if (stones != 0)
			{
				stonesString = (int)stones + " stones, ";
			}
		}
		
		if (ounces == 0)
		{
			if (pounds == 1)
			{
				poundsString = (int)pounds + " pound ";
			}
			else if (pounds != 0)
			{
				poundsString = (int)pounds + " pounds ";
			}
		}
		else
		{
			if (pounds == 1)
			{
				poundsString = (int)pounds + " pound, ";
			}
			else if (pounds != 0)
			{
				poundsString = (int)pounds + " pounds, ";
			}
		}
		
		if (ounces == 1)
		{
			ouncesString = (int)ounces + " ounce ";
		}
		else if (ounces != 0)
		{
			ouncesString = (int)ounces + " ounces ";
		}
		
		if (stones == 0 && pounds == 0 && ounces == 0)
		{
			ouncesString = "0 ounces ";
		}
		String output =  stonesString + poundsString + ouncesString + "is equal to " + totalKilograms + "kg";
		return output;
	}
}