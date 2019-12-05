package Factory;

public class KeyBoardFactory {
	public KeyBoard createKeyboard(String type) {
		KeyBoard keyboard = null;
		switch (type) {
		case "LG" : 
			keyboard = new LGKeyBoard();
			break;
		case "SS" : 
			keyboard = new SSKeyBoard();
			break;
		}
		return keyboard;
	}
}
