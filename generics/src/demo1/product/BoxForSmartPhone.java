package demo1.product;

public class BoxForSmartPhone<T extends SmartPhone> {

	// 제네릭의 제한
	// 제네릭 타입에 extends를 사용하면 특정 타입의 자손들만 타입 파라미터로 대입할 수 있다.
	private T t;
	
	public void add(T t) {
		this.t = t;
	}
	
	public T get() {
		return t;
	}
}
