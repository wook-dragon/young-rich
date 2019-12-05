package Factory;

public class Client {
	public static void main(String[] args) {
		FactoryOfComputerFactory factoryOfComputerFactory = new FactoryOfComputerFactory();
		factoryOfComputerFactory.createComputer("LG");
	}
}

/*

팩토리 메서드 패턴을 사용하는 이유는 클래스 간의 결합도를 낮취기 위해서다. 클래스에 변경이 생겼을 때 다른 클래스 영향을 덜 주기 때문이다.

그리고 객체생성 코드를 전부 하나의 객체 또는 메소드에 구현하기 때문에 코드에 중복되는 내용을 제거할 수 있고, 수정에도 용이하다. 

클라이언트 입장에서는 객체 인스턴스를 만들 때 필요한 구상클래스가 아닌 인터페이스(추상메서드)만 필요로하게 된다. 
인터페이스(추상메서드)를 바탕으로 프로그래밍한다는 것은 유연성과 확장성이 큰 코드를 짤 수 있다는 장점이 있다. 
결론적으로는 추상화 된 것에 의존을 하고 구상클래스에 의존하지 않기 때문에 팩토리 메서드 패턴은 객체지향의 역전의존의 법칙에 부합한 패턴이라고 볼 수 있다.

*/