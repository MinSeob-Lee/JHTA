package oop9;

public class NormalMonitor extends AbstractMonitor {

	// Monitor 인터페이스의 추상화된 메소드 정의(구현)함.
	
	@Override
	public void display() {
		if (!getPower()) {
			System.out.println("전원이 꺼져있습니다.");
		}
		if (getPower())
			System.out.println("컬러로 동영상을 표시합니다.");
	}
}
