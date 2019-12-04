package kr.or.bit;

public abstract class Application { // ���븦 �����ϴ� �߻� Ŭ����
	protected View myView;
	
	public void initInstance() {
		myView = MakeView(); // �� ��ü�� ����
	}
	public void Run() {
		myView.Show();
	}
	public void ExitInstance() {
		myView = null;
	}
	protected abstract View MakeView(); // �� ��ü�� �����ϴ� �޼��� ���
}
