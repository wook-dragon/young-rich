package kr.or.bit;

public class MyApp extends Application { // 추상클래스 application 상속
	
	public void InitInstance() { // 재정의
		System.out.println("재정의");
		super.initInstance(); // 재정의 
	}
	
	@Override
	public void ExitInstance() { // 재정의
		// TODO Auto-generated method stub
		System.out.println("Myapp 해제");
		super.ExitInstance(); // 객체 해제
	}
	@Override
	protected View MakeView() { // 뷰 개체를 생성하는 메서드 구체적 구현
		// TODO Auto-generated method stub
		return new MyView(); // 새로운 view 생성해서 주소값 리턴
	}
}
