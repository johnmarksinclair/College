
public class Vectors {

	public static void main(String[] args) 
	{
		
	}
	
	public static double getMagnitude(double[] vector)
	{
		if (vector == null)
		{
			return 0.0;
		}
		else
		{
			double sumOfSquares = 0;
			for (int index = 0; index < vector.length; index++)
			{
				sumOfSquares = sumOfSquares + (vector[index]*vector[index]);
			}
			double magnitude = Math.sqrt(sumOfSquares);
			return magnitude;
		}
	}
	
	public static void normaliseVector(double[] vector)
	{
		if (vector != null)
		{
			double vectorMagnitude = getMagnitude(vector);
			if (vectorMagnitude != 0.0)
			{
				for (int index = 0; index < vector.length; index++)
				{
					vector[index] = vector[index]/vectorMagnitude;
				}
			}
		}
	}
	
	public static double getDotProduct(double[] vectorOne, double[] vectorTwo)
	{
		double dotProduct = 0;
		if (vectorOne != null && vectorTwo != null && vectorOne.length == vectorTwo.length)
		{
			for (int index = 0; index < vectorOne.length; index++)
			{
				dotProduct = dotProduct + (vectorOne[index]*vectorTwo[index]);
			}
		}
		return dotProduct;
	}
	
	public static double[] getVectorSum(double[] vectorOne, double[] vectorTwo)
	{
		double[] vectorSum = new double[vectorOne.length];
		if (vectorOne != null && vectorTwo != null && vectorOne.length == vectorTwo.length)
		{
			for (int index = 0; index < vectorOne.length; index++)
			{
				vectorSum[index] = vectorSum[index] + (vectorOne[index] + vectorTwo[index]);
			}
		}
		return vectorSum;
	}
}