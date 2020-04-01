package ex1;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;

public class ExceptionDemo5 {

	public static void main(String[] args) {
		try {
			ExceptionDemo5.saveImages("https://www.twosome.co.kr:7009/Twosome_file/PRODUCT/1483_big_img");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 예외처리를 saveImage() 메소드를 호출한 측에 위임하기
	//		throws 키워드를 사용하면 해당 메소드 안에서 발생이 예상되는 예외에 대한 처리를
	//		이 메소드를 호출한 측에 떠넘길 수 있다.
	private static void saveImages(String path) throws MalformedURLException, IOException {
		URL url = new URL(path);
		
		InputStream in  = url.openStream();
		FileOutputStream out = new FileOutputStream("c:/files/iu.jpg");
		
		ExceptionDemo5.copy(in, out);
	}
	
	private static void copy(InputStream in, OutputStream out) throws IOException {
		byte[] buf = new byte[1024];
		int len = 0;
		while((in.read(buf)) != -1) {
			out.write(buf, 0, len);
		}
		out.close();
	}
}
