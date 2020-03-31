package opp11;

public class HTAListDemo {

	public static void main(String[] args) {
		HTAList list = new HTAList();
		
		// 값을 저장함
		list.add("홍길동");
		list.add("김유신");
		list.add("강감찬");
		list.add("이순신");
		list.add("유관순");
		
		// 값 꺼내기
		HTAIterator hta = list.iterator();
		
		// Iterator와 hasNext()가 true를 반환하는 동안 while 블록내의 수행문이 실행된다.
		while(hta.hasNext()) {
			String value = hta.next();
			System.out.println("이름 : " + value);
		}
	}
}
