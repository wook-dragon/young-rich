package kr.or.bit;

public class MyApp extends Application { // �߻�Ŭ���� application ���
	
	public void InitInstance() { // ������
		System.out.println("������");
		super.initInstance(); // ������ 
	}
	
	@Override
	public void ExitInstance() { // ������
		// TODO Auto-generated method stub
		System.out.println("Myapp ����");
		super.ExitInstance(); // ��ü ����
	}
	@Override
	protected View MakeView() { // �� ��ü�� �����ϴ� �޼��� ��ü�� ����
		// TODO Auto-generated method stub
		return new MyView(); // ���ο� view �����ؼ� �ּҰ� ����
	}
}
