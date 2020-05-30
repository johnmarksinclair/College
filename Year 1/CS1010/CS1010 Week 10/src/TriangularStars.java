/* SELF ASSESSMENT

 1. Did I use easy-to-understand meaningful variable names formatted properly (in lowerCamelCase)?

        Mark out of 5:5         Comment:Yes.

 2. Did I indent the code appropriately?

        Mark out of 5:5         Comment:Yes.

 3. Did I write the determineStarNumber or determineTriangleNumber function correctly (parameters, return type and function body) and invoke it correctly?

       Mark out of 20:20        Comment:Yes, I think so.

 4. Did I write the isStarNumber function correctly (parameters, return type and function body) and invoke it correctly?

       Mark out of 20:20        Comment:Yes.

 5. Did I calculate and/or check triangle numbers correctly?

       Mark out of 15:15        Comment:Yes.

 6. Did I loop through all possibilities in the program using system defined constants to determine when to stop?

       Mark out of 10:10        Comment:Yes.

 7. Does my program compute and print all the correct triangular star numbers?

       Mark out of 20:20        Comment:Yes.

 8. How well did I complete this self-assessment?

        Mark out of 5:5         Comment:I think I completed It well.

 Total Mark out of 100 (Add all the previous marks):100

*/ 

public class TriangularStars {

	public static int MAX_INT_VALUE = 2147483647;
	
	public static void main(String[] args) 
	{
		int index = 1;
		int triangleAndStarNumber = 0;
		int prevTriangleAndStarNumber = 0;
		boolean finished = false;
		System.out.println("The following numbers are triangular star numbers: ");
		while (triangleAndStarNumber <= MAX_INT_VALUE && finished == false)
		{
			triangleAndStarNumber = determineTriangleNumber(index);
			if (prevTriangleAndStarNumber != triangleAndStarNumber && 
					triangleAndStarNumber != -1)
			{
				System.out.println(triangleAndStarNumber);
			}
			if (triangleAndStarNumber == -1)
			{
				finished = true;
			}
			prevTriangleAndStarNumber = triangleAndStarNumber;
			index++;
		}
	}
	
	public static int determineTriangleNumber(int index)
	{
		int triangleAndStarNumber = 1;
		int t = 1;
		while (t <= MAX_INT_VALUE && t > 0)
		{
			t = (index*(index+1))/2;
			if (isStarNumber(t))
			{
				triangleAndStarNumber = t;
				return triangleAndStarNumber;
			}
			index++;
		}
		return -1;
	}
	
	public static boolean isStarNumber(int possibleStarNumber)
	{
		boolean isStarNumber = false;
		int numberIndex = 1;
		int s = 0;
		while (s <= possibleStarNumber && !isStarNumber)
		{
			s = ((6*numberIndex)*(numberIndex-1)) + 1;
			if (s == possibleStarNumber)
			{
				isStarNumber = true;
			}
			numberIndex++;
		}
		return isStarNumber;
	}
}