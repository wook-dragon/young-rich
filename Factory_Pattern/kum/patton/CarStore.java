package patton;

public class CarStore {

	public static void main(String[] args) {
		CarBrand brand = CarFactory2.createCar(CarNames.Kia);
		System.out.println("차 이름 :" + brand.getName());
	
		CarBrand brand2 = CarFactory2.createCar(CarNames.Hyundai);
		System.out.println("차 이름 :" + brand2.getName());
	}

}
