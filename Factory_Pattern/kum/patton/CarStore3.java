package patton;

public class CarStore3 {

	public static void main(String[] args) {
		CarBrand brand = CarFactory2.createCar(CarNames.Kia);
		System.out.println("차 이름 :" + brand.getName() + " " + "차 가격 : " + brand.getPrice());
	
		CarBrand brand2 = CarFactory2.createCar(CarNames.Hyundai);
		System.out.println("차 이름 :" + brand2.getName() + " " + "차 가격 : " + brand2.getPrice());
	}

}
