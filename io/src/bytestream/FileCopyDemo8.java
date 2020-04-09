package bytestream;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import org.apache.commons.io.IOUtils;

public class FileCopyDemo8 {

	public static void main(String[] args) throws IOException {
		
		URL url = new URL("https://kr.vuejs.org/v2/index.html");
		
		InputStream is = url.openStream();
		FileOutputStream fos = new FileOutputStream("c:/files/vuejs가이드.html");		// 사이트의 권한이 없어 실행이 불가능함
		
		IOUtils.copy(is, fos);
	}
}
