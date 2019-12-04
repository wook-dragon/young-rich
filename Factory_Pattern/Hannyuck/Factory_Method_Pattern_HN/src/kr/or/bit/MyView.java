package kr.or.bit;

public class MyView implements View { // View Interface 참조
	
	
	public MyView() {
		System.out.println("MyView 개체 생성"); // 생성자
	}

	@Override
	public void Show() {
		// TODO Auto-generated method stub
		System.out.println("Main View 활성화"); // 보여주기 기능에 대한 메서드 약속
	}

}
