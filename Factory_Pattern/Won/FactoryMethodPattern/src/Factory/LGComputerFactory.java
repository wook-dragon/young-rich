package Factory;

public class LGComputerFactory implements ComputerFactory{
	public LGKeyBoard createKeyboard() {
		return new LGKeyBoard();
	}
	
	public LGMouse createMouse() {
		return new LGMouse();
	}
}
