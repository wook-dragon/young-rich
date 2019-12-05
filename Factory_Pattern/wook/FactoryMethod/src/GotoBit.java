
public class GotoBit {
	public BitCamp study(String name) {
		if(name==null) {
			return null;
		}
		if(name.equalsIgnoreCase("gangnam")) {
			return new GangNamBit();
		}else if(name.equalsIgnoreCase("jongro")) {
			return new JongRoBit();
		}else if(name.equalsIgnoreCase("sinchon")) {
			return new SinChonBit();
		}
		
		return null;
	}
}
