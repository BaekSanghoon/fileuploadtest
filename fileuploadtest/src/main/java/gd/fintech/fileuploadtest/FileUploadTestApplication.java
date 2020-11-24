package gd.fintech.fileuploadtest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import gd.fintech.fileuploadtest.vo.VoTest;

@SpringBootApplication
public class FileUploadTestApplication {

	public static void main(String[] args) {
		SpringApplication.run(FileUploadTestApplication.class, args);
		VoTest vt = new VoTest();
		vt.getX();
		vt.setX(7);
		
		System.out.println(vt);
	}

}
