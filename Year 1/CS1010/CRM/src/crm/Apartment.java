package crm;

public class Apartment {
	//global member variables
	private String complex, block, aptNumber;
	//owner member variables
	private boolean ownerOccupied;
	private String ownerName, ownerAddress, ownerEmail;
	private int ownerMobile, ownerHome, ownerEmergencyNumber;
	//tennant member variables
	private String tennantName, tennantEmail;
	private int tennantMobile, tennantHome, tennantEmergencyNumber;
	
	
	//owner occupied apartment constructor
	public Apartment(String complex, String aptNumber, boolean ownerOccupied, String ownerName, String ownerEmail, int ownerMobile, int ownerHome, int ownerEmergencyNumber) {
		this.complex = complex;
		this.aptNumber = aptNumber;
		this.ownerOccupied = ownerOccupied;
		this.ownerName = ownerName;
		this.ownerAddress = block + aptNumber + ", " + complex;
		this.ownerEmail = ownerEmail;
		this.ownerMobile = ownerMobile;
		this.ownerHome = ownerHome;
		this.ownerEmergencyNumber = ownerEmergencyNumber;
		this.tennantName = null;
		this.tennantEmail = null;
		this.tennantMobile = 0;
		this.tennantHome = 0;
		this.tennantName = null;
	}
	
	//tennant occupied apartment constructor
	public Apartment(String complex, String aptNumber, boolean ownerOccupied, String ownerName, 
			String ownerAddress, String ownerEmail, int ownerMobile, int ownerHome, int ownerEmergencyNumber, String tennantName, 
			String tennantEmail, int tennantMobile, int tennantHome, int tennantEmergencyNumber) {
		this.complex = complex;
		this.aptNumber = aptNumber;
		this.ownerOccupied = ownerOccupied;
		this.ownerName = ownerName;
		this.ownerAddress = ownerAddress;
		this.ownerEmail = ownerEmail;
		this.ownerMobile = ownerMobile;
		this.ownerHome = ownerHome;
		this.ownerEmergencyNumber = ownerEmergencyNumber;
		this.tennantName = tennantName;
		this.tennantEmail = tennantEmail;
		this.tennantMobile = tennantMobile;
		this.tennantHome = tennantHome;
		this.tennantName = tennantName;
	}
	
	public String toString() {
		String output = complex + ", " + aptNumber + ", " + ownerOccupied + ", " + ownerName + ", " + ownerEmail;
		return output;
	}
}