package kr.or.bit;

public class ConcreteFactory1 extends AbstractFactory {

	@Override
	public AbstractProductA CreateProductA() {
		// TODO Auto-generated method stub
		return (AbstractProductA)new ProductA1();
	}

	@Override
	public AbstractProductB CreateProductB() {
		// TODO Auto-generated method stub
		return (AbstractProductB)new ProductB1();
	}

}
