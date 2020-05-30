package week5;

public class Harness {
	
	public final int MAX_USES_BEFORE_CHECK = 25;
	private int modelNumber, uses;
	private String make, instructor, loanee;
	private boolean onLoan, needsCheck;

	public Harness(String make, int modelNumber, int uses, String instructor, boolean onLoan, String loanee) {
		this.make = make;
		this.modelNumber = modelNumber;
		this.uses = uses;
		this.instructor = instructor;
		this.onLoan = onLoan;
		if (this.onLoan)
			this.loanee = loanee;
		this.needsCheck = false;
	}

	public Harness(String make, int modelNumber, String instructor) {
		this(make, modelNumber, 0, instructor, false, null);
	}

	public void checkHarness(String instructor) {
		if (!this.isHarnessOnLoan() && instructor != null) {
			this.uses = 0;
			this.needsCheck = false;
			this.instructor = instructor;
		}
	}
	
	public boolean isHarnessOnLoan() {
		return this.onLoan;
	}
	
	public boolean canHarnessBeLoaned() {
		if (!this.isHarnessOnLoan() && !needsCheck())
			return true;
		else 
			return false;
	}
	
	public void loanHarness(String loanee) {
		if (this.canHarnessBeLoaned()) {
			this.onLoan = true;
			this.loanee = loanee;
			this.uses++;
		}
	}
	
	public void returnHarness() {
		if (this.isHarnessOnLoan()) {
			this.onLoan = false;
			this.loanee = "null";
		}
	}
	
	public String toString() {
		return "\nMake: " + this.make + ", Model Number: " + this.modelNumber + 
				", Uses: " + this.uses + ", Last checked by: " + this.instructor + ", Needs checking: " + needsCheck + ", Harness is on loan: " 
				+ this.onLoan + ", Loanee: " + this.loanee;
	}
	
	public int getModelNumber() {
		return modelNumber;
	}
	
	public String getMake() {
		return make;
	}

	public boolean needsCheck() {
		if (this.uses >= MAX_USES_BEFORE_CHECK) {
			this.needsCheck = true;
		}
		return this.needsCheck;
	}
}