package class;

public class FactoryOfComputerFactory {
	  public void createComputer(String type){
	        ComputerFactory computerFactory= null;
	        switch (type){
	            case "LG":
	                computerFactory = (ComputerFactory)new LGComputerFactory();
	                break;

	            case "Samsung":
	                computerFactory = (ComputerFactory)new SamsungComputerFactory();
	                break;
	        }

	        computerFactory.createKeyboard();
	        computerFactory.createMouse();
	    }
}
