
public class ChargeCard {

	private double funds;

	public ChargeCard() {
		this.funds = 0.0;
	}

	public void topUpFunds(double funds) {
		this.funds += funds;
	}

	public void removeFunds(double funds) {
		this.funds -= funds;
	}

	public double getFunds() {
		return funds;
	}

	public void setFunds(double funds) {
		this.funds = funds;
	}

}