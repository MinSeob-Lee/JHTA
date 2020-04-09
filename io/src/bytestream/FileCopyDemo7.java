package bytestream;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import org.apache.commons.io.IOUtils;

public class FileCopyDemo7 {

	public static void main(String[] args) throws FileNotFoundException, IOException {		
		URL url = new URL("https://lh3.googleusercontent.com/proxy/KG5wfL6C_CN91zVQkncDjwERFb_ZWZAAQewyar7Uby0SmPlybVFNEsu2oqo3dlljP-t6Wn7fFr8VovB3ILje0ekBDHQGr-qmtTo__gTa3MFe7onDOH4L63c");
		
		InputStream is = url.openStream();
		FileOutputStream fos = new FileOutputStream("c:/files/sushi.jpg");
		
		IOUtils.copy(is, fos);
	}
}
