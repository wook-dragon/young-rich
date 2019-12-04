package patton;

public class CarFactory {
	public static Kia createKia() {
		return new Kia();
		
	}
	
	public static Hyundai createHyundai() {
		return new Hyundai();
		
	}
	
	public static Samsung createSamsung() {
		return new Samsung();
		
	}
}
