package oop4;

public class Reporter {

	String[] data;
	DataOutput outputter;

	// DataOutput류 객체를 전달받아서 멤버변수 outputter에 담은 메소드
	void setOutputter(DataOutput dataOutput) {
		this.outputter = dataOutput;
	}

	void setData(String[] data) {
		this.data = data;
	}

	void reporting() {
		outputter.output(data);
	}
}
