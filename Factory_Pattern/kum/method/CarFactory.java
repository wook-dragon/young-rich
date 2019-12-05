package patton;
enum CarNames {
	Kia , Hyundai 
}

public class CarFactory {
	public static CarBrand createCar(CarNames Car) {
		switch(Car) {
		case Kia : return new Kia();
		case Hyundai : return new Hyundai();
		default : return null;
		}
		
		
	}
}
