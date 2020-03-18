package oop2;

public class GugudanDemo {

	public static void main(String[] args) {
		Gugudan gugudan = new Gugudan();
		
		gugudan.print99dan();
		
		gugudan.print99danByNumber(5);
		gugudan.print99danByNumber(19);
		
		gugudan.print99danByRange(5, 10);
		gugudan.print99danByRange(11, 19);
	}
}
