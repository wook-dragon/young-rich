
public class Main {

	public static void main(String[] args) {
		GotoBit gotobit = new GotoBit();
		
		BitCamp bit1 = gotobit.study("gangnam");
		bit1.enrollBit();
		BitCamp bit2 = gotobit.study("jongro");
		bit2.enrollBit();
		BitCamp bit3 = gotobit.study("sinchon");
		bit3.enrollBit();
	}

}
