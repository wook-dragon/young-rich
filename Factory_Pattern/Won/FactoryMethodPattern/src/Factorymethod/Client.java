package Factorymethod;

public class Client {
	public static void main(String[] args) {
		TypeFactory classA = new TypeFactory();
		classA.createType("A");
	}
}
