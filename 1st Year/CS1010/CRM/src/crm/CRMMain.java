package crm;

import java.io.*;
import java.util.*;
import javax.swing.*;

public class CRMMain {
	public static int COMPLEX_INDEX = 0;
	public static int APT_NUMBER_INDEX = 1;
	public static int OWNER_OCCUPIED_INDEX = 2;
	public static int OWNER_NAME_INDEX = 3;
	public static int OWNER_EMAIL_INDEX = 4;
	public static int OWNER_MOBILE_INDEX = 5;
	public static int OWNER_HOME_INDEX = 6;
	public static int OWNER_EMERGENCY_INDEX = 7;
	
	public static Apartment test = null;

	public static void main(String[] args) {
		String[] complexes = {"Jervis Place", "Charter House", "Cameron Court", "Capel Court", "New Row Square"};
		int choice = JOptionPane.showOptionDialog(null, "What company?", "", JOptionPane.DEFAULT_OPTION, 
				JOptionPane.PLAIN_MESSAGE, null, complexes, complexes[0]);
		String choiceString = "";
		switch (choice) {
		case 0:
			choiceString = "JervisPlaceApartments";
			break;
		case 1:
			choiceString = "CharterHouseApartments";
			break;
		case 2:
			choiceString = "CameronCourtApartments";
			break;
		case 3:
			choiceString = "CapelCourtApartments";
			break;
		case 4:
			choiceString = "NewRowSquareApartments";
			break;
		}
		ApartmentRecords records = null;
		if (!choiceString.equals("")) {
			records = readFromTxt(choiceString);
		}
		for (int index = 0; index < records.getSize(); index++) {
			String recordsString = records.returnRecordsString(index);
			JOptionPane.showMessageDialog(null, recordsString);
		}
		String recordsString = records.returnRecordsString(0);
		JOptionPane.showMessageDialog(null, recordsString);
	}
	
	//will read in info from fileName.txt
	public static ApartmentRecords readFromTxt(String fileName) {
		ArrayList<Apartment> apartments = new ArrayList<Apartment>();
		try {
			FileReader fileReader = new FileReader(fileName + ".txt");
			BufferedReader bufferedReader = new BufferedReader(fileReader);
			boolean endOfFile = false;
			while (!endOfFile) {
				String aprtmentLine = bufferedReader.readLine();
				if (aprtmentLine != null) {
					String[] apartmentData = aprtmentLine.split(", ");
					String complex = apartmentData[COMPLEX_INDEX];
					String aptNumber = apartmentData[APT_NUMBER_INDEX];
					boolean ownerOccupied = Boolean.parseBoolean(apartmentData[OWNER_OCCUPIED_INDEX]);
					String ownerName = apartmentData[OWNER_NAME_INDEX];
					String ownerEmail = apartmentData[OWNER_EMAIL_INDEX];
					int ownerMobile = Integer.parseInt(apartmentData[OWNER_MOBILE_INDEX]);
					int ownerHome = Integer.parseInt(apartmentData[OWNER_HOME_INDEX]);
					int ownerEmergencyNumber = Integer.parseInt(apartmentData[OWNER_EMERGENCY_INDEX]);
					
					Apartment apartment = new Apartment(complex, aptNumber, ownerOccupied, ownerName, 
							ownerEmail, ownerMobile, ownerHome, ownerEmergencyNumber);
					//delete 3 below//
//					test = apartment;
//					String testString = test.toString();
//					writeToDatabaseTxt(testString, "database");
					/////////////////
					apartments.add(apartment);
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
		ApartmentRecords apartmentRecords = new ApartmentRecords(apartments);
		return apartmentRecords;
	}
	
	//will overwrite existing database.txt
	public static void writeToDatabaseTxt(String string, String fileName) {
		try { 
		    BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(fileName + ".txt"));
		    bufferedWriter.write(string);
		    bufferedWriter.close();  
		} catch (IOException e) {  
		    e.printStackTrace();  
		}
	}
}