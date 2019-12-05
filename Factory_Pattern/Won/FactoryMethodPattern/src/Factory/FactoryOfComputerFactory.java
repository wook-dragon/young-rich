package Factory;

public class FactoryOfComputerFactory {
	public void createComputer(String type) {
		ComputerFactory computerFactory = null;
		switch(type) {
		case "LG" :
			computerFactory = new LGComputerFactory();
			break;
			
		case "SS" : 
			computerFactory = new SSComputerFactory();
			break;
		}
		computerFactory.createKeyboard();
		computerFactory.createMouse();
	}
}
