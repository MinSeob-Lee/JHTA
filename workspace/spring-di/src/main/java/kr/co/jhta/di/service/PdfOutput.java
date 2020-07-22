package kr.co.jhta.di.service;

public class PdfOutput implements Output {

	@Override
	public void write(String text) {
		System.out.println("PDF : " + text);
	}
}
