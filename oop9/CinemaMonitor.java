package oop9;

public class CinemaMonitor extends AbstractMonitor implements Speakable {

	private String screenSize;
	private int volume;
	
	public CinemaMonitor() {
		this.screenSize = "100인치";
		this.volume = 50;
	}
	
	public CinemaMonitor(String screenSize) {
		this.screenSize = screenSize;
	}
	
	@Override
	public void display() {
		if(!this.powerCheck()) {
			return;
		}
		System.out.println("["+screenSize+"] 크기 스크린으로 동영상을 재생합니다.");
	}
	
	@Override
	public void sound() {
		if(!this.powerCheck()) {
			return;
		}
		System.out.println("["+volume+"]으로 소리를 재생합니다.");
	}
	
	@Override
	public void volumeDown() {
		if(!this.powerCheck()) {
			return;
		}
		if(volume < Speakable.MIN_VOLUME) {
			volume = Speakable.MIN_VOLUME;
		}
		volume -= 5;
		System.out.println("현재 볼륨 : " + volume);
	}
	
	@Override
	public void volumeUp() {
		if(!this.powerCheck()) {
			return;
		}
		if(volume < Speakable.MAX_VOLUME) {
			volume = Speakable.MAX_VOLUME;
		}
		volume += 5;
		System.out.println("현재 볼륨 : " + volume);
	}
	
	private boolean powerCheck() {
		if(!getPower()) {
			System.out.println("전원이 꺼져있습니다.");
			return false;
		}
		return true;
	}
}
