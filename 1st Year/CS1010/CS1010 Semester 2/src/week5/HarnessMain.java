/* SELF ASSESSMENT

Harness Class: Member variables (8 marks)
All my data members are declared, private and the ones that don't change are marked as private. I also have a 
constant for the maximum number of uses of a harness.
Comment: Yes, all my data members are declared as private and I have a constant in the Harness class that 
holds the max no. of uses

Harness Class: Harness constructor 1 & constructor 2 (6 marks)
I initialise all the variables using the parameters given and set the other members to reasonable default values.
Comment: Yes, i have two constructors, one which takes in values for all variables (except needsCheck) and creates an 
object and another that takes in just the make, model number and instructor name, setting the rest of the variables to defaults.

Harness Class: checkHarness method (5 marks)
My method takes an instructor's name as a parameter, and if the harness is not on loan sets the instructor member 
variable to the given parameter value (assuming the instructor's name is not null/empty). It also resets the 
number of times the harness was used.
Comment: Yes, my function does exactly this, it takes in an instructor name (String) and as long as its not null, it will reset 
the uses to 0, the boolean needsCheck to false and the instructor to the passed String.

Harness Class: isHarnessOnLoan method (2 marks)
My method has no parameters and returns the value of the loan status variable.
Comment: Yes, my function does exactly this, it returns the boolean onLoan when called.

Harness Class: canHarnessBeLoaned method (4 marks)
My method has no parameters and returns true if the harness is not on loan and if the number of times it was 
used is less than the maximum allowed number of times.
Comment: Yes, my method takes no parameters, and it'll return true if the harness can be loaned. A harness will not be available 
for loan if its uses is >= 25.

Harness Class: loanHarness method (6 marks)
My method has a member name as a parameter and it checks if harness can be loaned by using the canHarnessBeLoaned
method. If true, it sets the club member value to the parameter value, sets the on loan status to true and increments 
the number of times used variable.
Comment: Yes, my method does exactly as described.
 
Harness Class: returnHarness method (5 marks)
My method has no parameters, checks if the harness is on loan, and if so, changes its on-loan status to false, 
and resets the club member value.
Comment: My methods works exactly as described, if the harness is on loan, when called this function sets the onLoan boolean 
to false and the loanee variable to null;

Harness Class: toString method (3 marks)
My method returns a String representation of all the member variables.
Comment: Yes, my method works exactly as described.

HarnessRecords Class: member variables (3 marks)
I declare the member variable as a private collection of Harnesses 
Comment: Yes, my member variable is a private ArrayList of Harness objects.

HarnessRecords Class: HarnessRecords constructor 1 & 2 (9 marks)
In the first constructor, I set the member variable to null [1 mark]. In the second constructor, I use the set 
of characteristics in the list to create Harness objects and add them to the collection. 
Comment: My first constructor works as described, my second contructor takes in an ArrayList of Harness objects 
and adds them to the collection.

HarnessRecords Class: isEmpty method (1 marks)
I return true if the collection is null/empty and, false otherwise.
Comment: Yes, my method works as described.

HarnessRecords Class: addHarness method (5 marks)
My method takes a Harness object as a parameter and adds the harness to the collection.
Comment: Yes, my method works as described.

HarnessRecords Class: findHarness method (6 marks)
My method takes a make and model number as parameters. It checks if a harness with such properties exists and if 
it does it returns harness object, otherwise returns null.
Comment: My method uses a for loop to run through the ArrayList of Harness objects and checks if there is any objects with the 
same make and model number, if there is it returns the object, if not it returns null.

HarnessRecords Class: checkHarness method (6 marks)
must take instructor name, make and model number as parameters and return a Harness. If a harness with the make 
and model number exists by using the findHarness method and is not on loan, the Harness method checkHarness is called 
with the instructor name as a parameter and the updated Harness object is returned. If the harness is not available returns null.
Comment: My method takes in the instructor name, the make and the model number as parameters and checks the harness object, provided 
it exists (checked using the findHarness() method) and is not currently out on loan (checked using the isHarnessOnLoan() method in the 
Harness class),  by passing the instructor name to the checkHarness() method in the Harness class.

HarnessRecords Class: loanHarness method (7 marks)
My method takes a club member name as a parameter and looks for an available harness by calling the method 
canHarnessBeLoaned be loaned. If an available harness is found it is loaned by using the Harness method loanHarness 
with the club member as a parameter, returning the harness. If there's no available harness null is returned.
Comment: Yes, my method works exactly as described.

HarnessRecords Class: returnHarness method (7 marks)
My method takes a make and model number as parameters. It checks if a harness with those properties exists by using 
the findHarness method. If the found harness is not null, it returns the harness object by using Harness method 
returnHarness, otherwise returns null.
Comment: My method works just as described, it takes in the make and model number as parameters and if there is a harness object 
matching those characteristics it calls the returnHarness() method in the Harness class.

HarnessRecords Class: removeHarness method (8 marks)
My method takes a make and model number as parameters and check the collection for a harness with those properties 
and removes it. It returns the harness object if it is found, otherwise returns null.
Comment: My method takes in the make and model number as parameters, if a harness object atching those characteristics can be found 
that object is removed from the collection and the harness object is returned, if a harness cannot be found matching those 
characteristics it returns null.

GUI (Java main line) (5 marks)
My test class has a menu which implements at least the five points specified using the HarnessRecords class methods.
Comment: Yes, my test class (HarnessMain) initially displays the collection on screen before asking what action would you like to be 
performed. It then performs desired action and displays the collection again.

*/

package week5;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

public class HarnessMain {
	public static int MAKE_INDEX = 0;
	public static int MODEL_NUMBER_INDEX = 1;
	public static int USES_INDEX = 2;
	public static int INSTRUCTOR_INDEX = 3;
	public static int LOAN_STATUS_INDEX = 4;
	public static int LOANEE_NAME_INDEX = 5;

	public static void main(String[] args) {
		HarnessRecords harnessRecords = new HarnessRecords(readInHarnessesFromTxt());
		System.out.println("Curent inventory:");
		harnessRecords.printOutRecords();
		boolean finished = false;
		Scanner scanner;
		while (!finished) {
			System.out.println("\n\nHarnesses that need checking:");
			harnessRecords.printHarnessesForChecking();
			System.out.println("\nWhat action would you like to perform?\n1 - Add new harness\n2 - Remove "
					+ "harness\n3 - Record harness check\n4 - Loan harness\n5 - Return harness\n6 - Quit\n");
			scanner = new Scanner(System.in);
			if (scanner.hasNextInt()) {
				int choice = scanner.nextInt();
				switch (choice) {
				case 1: 
					System.out.print("\nHarness make: ");
					String make = scanner.next();
					System.out.print("Harness model number: ");
					int modelNumber = scanner.nextInt();
					scanner = new Scanner(System.in);
					System.out.print("Instructor name: ");
					String instructor = scanner.nextLine();
					Harness harness = new Harness(make, modelNumber, instructor);
					harnessRecords.addHarness(harness);
					System.out.println("\nCurent inventory:");
					harnessRecords.printOutRecords();
					break;
				case 2: 
					System.out.print("\nHarness make: ");
					make = scanner.next();
					System.out.print("Harness model number: ");
					modelNumber = scanner.nextInt();
					harnessRecords.removeHarness(make, modelNumber);
					System.out.println("\nCurent inventory:");
					harnessRecords.printOutRecords();
					break;
				case 3: 
					System.out.print("\nHarness make: ");
					make = scanner.next();
					System.out.print("Harness model number: ");
					modelNumber = scanner.nextInt();
					scanner = new Scanner(System.in);
					System.out.print("Instructor name: ");
					instructor = scanner.nextLine();
					harnessRecords.checkHarness(instructor, make, modelNumber);
					if (harnessRecords.checkHarness(instructor, make, modelNumber) == null) {
						System.out.println("Harness cannot be checked, it doesn't exist or is out on loan");
					}
					System.out.println("\nCurent inventory:");
					harnessRecords.printOutRecords();
					break;
				case 4:
					System.out.print("\nMember name: "); 
					scanner = new Scanner(System.in);
					String member = scanner.nextLine();
					Harness test = harnessRecords.loanHarness(member);
					if (test == null) {
						System.out.println("\nNo available harnesses");
					}
					System.out.println("\nCurent inventory:");
					harnessRecords.printOutRecords();
					break;
				case 5: 
					System.out.print("\nHarness make: ");
					make = scanner.next();
					System.out.print("Harness model number: ");
					modelNumber = scanner.nextInt();
					harnessRecords.returnHarness(make, modelNumber);
					System.out.println("\nCurent inventory:");
					harnessRecords.printOutRecords();
					break;
				case 6:
					finished = true;
					break;
				}
			}
			else {
				System.out.println("\nThat is not a valid input");
				System.out.println("\nCurent inventory:");
				harnessRecords.printOutRecords();
			}
		}	
	}
	
	public static ArrayList<Harness> readInHarnessesFromTxt() {
		ArrayList<Harness> harnesses = new ArrayList<Harness>();
		try {
			FileReader fileReader = new FileReader("harnesses.txt");
			BufferedReader bufferedReader = new BufferedReader(fileReader);
			boolean endOfFile = false;
			while (!endOfFile) {
				String harnessLine = bufferedReader.readLine();
				if (harnessLine != null) {
					String[] harnessData = harnessLine.split(", ");
					String make = harnessData[MAKE_INDEX];
					int modelNumber = Integer.parseInt(harnessData[MODEL_NUMBER_INDEX]);
					int uses = Integer.parseInt(harnessData[USES_INDEX]);
					String instructor = harnessData[INSTRUCTOR_INDEX];
					Boolean onLoan = Boolean.parseBoolean(harnessData[LOAN_STATUS_INDEX]);
					String loanee = harnessData[LOANEE_NAME_INDEX];
					Harness harness = new Harness(make, modelNumber, uses, instructor, onLoan, loanee);
					harnesses.add(harness);
				}
				else 
					endOfFile = true;
			}
			bufferedReader.close();
			fileReader.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return harnesses;
	}
}