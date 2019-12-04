package kr.or.bit;

public abstract class Application { // 뼈대를 제공하는 추상 클래스
	protected View myView;
	
	public void initInstance() {
		myView = MakeView(); // 뷰 개체를 설정
	}
	public void Run() {
		myView.Show();
	}
	public void ExitInstance() {
		myView = null;
	}
	protected abstract View MakeView(); // 뷰 개체를 생성하는 메서드 약속
}
