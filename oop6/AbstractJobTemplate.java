package oop6;

public abstract class AbstractJobTemplate {

	void setup() {
		System.out.println("### 전처리 작업 시작 ###");
		System.out.println("데이터베이스 서버에 연결을 요청함");
		System.out.println("데이터베이스와 연결이 완료됨");
	}

	// 추상 메소드
	// 자손 클래스에서 실제 구현을 위임하기 위해서 메소드 설계(정의, 선언)함
	abstract void work();

	void destroy() {
		System.out.println("### 후처리 작업 시작 ###");
		System.out.println("데이터베이스 서버에 연결해제를 요청함");
		System.out.println("데이터베이스와 연결이 해제됨");
	}
	
	// 작업을 처리하기 위한 절차대로 메소드를 실행하는 
	void run() {
		setup();
		work();
		destroy();
	}
}
