package patton;
enum CarNames {
	Kia , Hyundai , Samsung
}

public class CarFactory2 {
	public static CarBrand createCar(CarNames Car) {
		switch(Car) {
		case Kia : return new Kia();
		case Hyundai : return new Hyundai();
		case Samsung : return new Samsung();
		default : return null;
		}
		
		
	}
}
