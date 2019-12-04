package patton;

public class CarStore2 {

	public static void main(String[] args) {
		CarBrand brand = CarFactory.createHyundai();
		System.out.println("차 이름 : " + brand.getName() + " "+ "차 가격 :" + brand.getPrice());
		
		CarBrand brand2 = CarFactory.createKia();
		System.out.println("차 이름 : " + brand2.getName() + " "+ "차 가격 :" + brand2.getPrice());
		
	}
	
	
}