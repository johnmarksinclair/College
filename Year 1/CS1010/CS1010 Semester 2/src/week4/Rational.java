package week4;

public class Rational {

	private int numer, denom;

	public Rational(int numerator, int denominator) {
		this.numer = numerator;
		if (denominator != 0)
			this.denom = denominator;
		else
			throw new ArithmeticException("Denominator cannot equal 0");
	}

	public Rational(int numerator) {
		this.numer = numerator;
		this.denom = 1;
	}

	public Rational add(Rational rational) {
		int commonDenominator = this.denom * rational.denom;
		int addedNumer = (this.numer * rational.denom) + (rational.numer * this.denom);
		Rational addedRational = new Rational(addedNumer, commonDenominator);
		addedRational.simplify();
		return addedRational;
	}

	public Rational subtract(Rational rational) {
		int commonDenominator = this.denom * rational.denom;
		int subbedNumer = (this.numer * rational.denom) - (rational.numer * this.denom);
		Rational subbedRational = new Rational(subbedNumer, commonDenominator);
		subbedRational.simplify();
		return subbedRational;
	}

	public Rational multiply(Rational rational) {
		int multipliedNumer = this.numer * rational.numer;
		int multipliedDenom = this.denom * rational.denom;
		Rational multipliedRational = new Rational(multipliedNumer, multipliedDenom);
		multipliedRational.simplify();
		return multipliedRational;
	}

	public Rational divide(Rational rational) {
		int dividedNumer = this.numer * rational.denom;
		int dividedDenom = this.denom * rational.numer;
		Rational dividedRational = new Rational(dividedNumer, dividedDenom);
		dividedRational.simplify();
		return dividedRational;
	}

	public boolean equals(Rational rational) {
		boolean equals = false;
		Rational referenceRational = new Rational(this.numer, this.denom);
		Rational passsedRational = new Rational(rational.numer, rational.denom);
		referenceRational.simplify();
		passsedRational.simplify();
		int newReferenceNumer = referenceRational.numer * passsedRational.denom;
		int newPassedNumer = passsedRational.numer * referenceRational.denom;
		if (newReferenceNumer == newPassedNumer)
			equals = true;
		return equals;
	}

	public boolean isLessThan(Rational rational) {
		boolean isLessThan = false;
		Rational referenceRational = new Rational(this.numer, this.denom);
		Rational passsedRational = new Rational(rational.numer, rational.denom);
		referenceRational.simplify();
		passsedRational.simplify();
		int newReferenceNumer = referenceRational.numer * passsedRational.denom;
		int newPassedNumer = passsedRational.numer * referenceRational.denom;
		if (newReferenceNumer < newPassedNumer)
			isLessThan = true;
		return isLessThan;
	}

	public Rational simplify() {
		int gcd = this.gcd();
		if (this.numer < 0 && this.denom < 0) {
			this.numer *= -1;
			this.denom *= -1;
		}
		if (this.numer == 0) {
			this.numer = 0;
			this.denom = 0;
		} else {
			this.numer = this.numer / gcd;
			this.denom = this.denom / gcd;
		}
		return this;
	}

	public int gcd() {
		int greaterNumber, lesserNumber, numerator = this.numer, denominator = this.denom, gcd = 1;
		if (this.numer < 0 && this.denom < 0) {
			numerator = this.numer * -1;
			denominator = this.denom * -1;
		}
		if (this.numer > this.denom) {
			greaterNumber = numerator;
			lesserNumber = denominator;
		} else {
			greaterNumber = numerator;
			lesserNumber = denominator;
		}
		for (int index = 1; index <= lesserNumber; index++) {
			if (greaterNumber % index == 0 && lesserNumber % index == 0) {
				gcd = index;
			}
		}
		return gcd;
	}

	public String toString() {
		String returnedString = this.numer + "/" + this.denom;
		return returnedString;
	}
}