package crm;

import java.util.*;
import javax.swing.*;

public class ApartmentRecords {
	
	private ArrayList<Apartment> apartmentList;
	
	public ApartmentRecords(ArrayList<Apartment> apartments) {
		apartmentList = new ArrayList<Apartment>();
		apartmentList.addAll(apartments);
	}
	
	public void printOutRecords() {
		JFrame frame = new JFrame("JOptionPane showMessageDialog example");
		for (int index = 0; index < apartmentList.size(); index++) {
			JOptionPane.showMessageDialog(frame, apartmentList.get(index).toString(), "Current Apt", JOptionPane.PLAIN_MESSAGE);
		}
	}
	
	public String returnRecordsString(int index) {
		return apartmentList.get(index).toString();
	}
	
	public int getSize() {
		return apartmentList.size();
	}
}