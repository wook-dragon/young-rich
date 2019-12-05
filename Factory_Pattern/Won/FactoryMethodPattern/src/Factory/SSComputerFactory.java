package Factory;

public class SSComputerFactory implements ComputerFactory{

	public SSKeyBoard createKeyboard() {
		return new SSKeyBoard();
	}
	
	public SSMouse createMouse() {
		return new SSMouse();
	}
}
