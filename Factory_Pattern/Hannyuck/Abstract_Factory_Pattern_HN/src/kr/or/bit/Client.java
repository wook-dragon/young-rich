package kr.or.bit;

public class Client {
	private AbstractProductA _abstractProductA;
    private AbstractProductB _abstractProductB;
 
    // Constructor

    public Client(AbstractFactory factory)
    {
      _abstractProductB = factory.CreateProductB();
      _abstractProductA = factory.CreateProductA();
    }
 
    public void Run()
    {
    	_abstractProductA.Interact(_abstractProductA);
      _abstractProductB.Interact(_abstractProductB);
    }
}
