package Factory;

public class MouseFactory {
	public Mouse createMouse(String type) {
		Mouse mouse = null;
		switch(type) {
		case "LG" :
			mouse = new LGMouse();
			break;
		case "SS" :
			mouse = new SSMouse();
			break;
		}
		return mouse;
	}
}
