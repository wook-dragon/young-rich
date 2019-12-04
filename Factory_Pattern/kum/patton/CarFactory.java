package patton;

public class CarFactory {
	public static CarBrand createKia() {
		return new Kia();
		
	}
	
	public static CarBrand createHyundai() {
		return new Hyundai();
		
	}
	
	public static CarBrand createSamsung() {
		return new Samsung();
		
	}
}
