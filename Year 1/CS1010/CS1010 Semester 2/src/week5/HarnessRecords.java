package week5;

import java.util.*;

public class HarnessRecords {

	private ArrayList<Harness> harnessList;

	public HarnessRecords() {
		harnessList = null;
	}

	public HarnessRecords(ArrayList<Harness> harnesses) {
		harnessList = new ArrayList<Harness>();
		harnessList.addAll(harnesses);
	}
	
//	public HarnessRecords(ArrayList<Harness> harnessCharacteristics) {
//		harnessList = new ArrayList<Harness>();
//		
//	}

	public boolean isEmpty() {
		if (harnessList == null)
			return true;
		else
			return false;
	}

	public void addHarness(Harness harness) {
		harnessList.add(harness);
	}

	public Harness findHarness(String make, int modelNumber) {
		for (int index = 0; index <= harnessList.size(); index++) {
			if (harnessList.get(index).getModelNumber() == modelNumber && harnessList.get(index).getMake().equals(make))
				return harnessList.get(index);
		}
		return null;
	}

	public Harness checkHarness(String instructor, String make, int modelNumber) {
		if (findHarness(make, modelNumber) != null && !findHarness(make, modelNumber).isHarnessOnLoan()) {
			findHarness(make, modelNumber).checkHarness(instructor);
			return findHarness(make, modelNumber);
		} else
			return null;
	}

	public Harness loanHarness(String member) {
		int index = 0;
		boolean finished = false;
		while (!finished && index < harnessList.size()) {
			if (harnessList.get(index).canHarnessBeLoaned()) {
				harnessList.get(index).loanHarness(member);
				finished = true;
				return harnessList.get(index);
			}
			index++;
		}
		return null;
	}

	public void returnHarness(String make, int modelNumber) {
		if (findHarness(make, modelNumber) != null) {
			findHarness(make, modelNumber).returnHarness();
		}
	}

	public Harness removeHarness(String make, int modelNumber) {
		Harness harness = findHarness(make, modelNumber);
		if (harness != null) {
			harnessList.remove(harness);
			return harness;
		} else
			return harness;
	}

	public void printOutRecords() {
		for (int index = 0; index < harnessList.size(); index++) {
			System.out.print(harnessList.get(index).toString());
		}
	}
	
	public void printHarnessesForChecking() {
		for (int index = 0; index < harnessList.size(); index++) {
			if (harnessList.get(index).needsCheck()) {
				System.out.println(harnessList.get(index).toString());
			}
		}
	}
}