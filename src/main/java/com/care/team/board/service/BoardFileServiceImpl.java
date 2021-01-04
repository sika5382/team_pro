package com.care.team.board.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class BoardFileServiceImpl implements BoardFileService{
	private final String IMAGE_REPO = "c:\\spring\\image_repo2";
	public Map<String, Object> getData(MultipartHttpServletRequest multipartRequest) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> writeMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			System.out.println("name"+name);
			System.out.println("value"+value);
			writeMap.put(name, value);
		}
		String imageFileName = uploadFile(multipartRequest);
		writeMap.put("image_file_name", imageFileName);
		return writeMap;
	}
	private String uploadFile(MultipartHttpServletRequest multipartRequest) throws Exception{
		String imageFileName= null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()){
			String fileName = fileNames.next();//name을 가져온다(file1, file2...)
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName=mFile.getOriginalFilename();//실제 파일명을 가져온다
			File file = new File(IMAGE_REPO +"\\"+"temp"+"\\"+ fileName);
			file.getParentFile().mkdirs(); //해당 경로 디렉터리 생성(존재하면 생성하지 않음)
			if(mFile.getSize()!=0){ //File Null Check
				//임시로 저장된 multipartFile을 실제 파일로 전송
				mFile.transferTo(new File(IMAGE_REPO +"\\"+"temp"+"\\"+imageFileName)); 
			}
		}
		return imageFileName;
	}

	public String getMessage(int result,int write_no, String image_file_name) throws Exception {
		String message = null;
		if(result != -1 ) {
			if(image_file_name != null && image_file_name.length() != 0) {
				File srcFile = new File(IMAGE_REPO+"\\"+"temp"+"\\"+image_file_name);
				File destDir = new File(IMAGE_REPO+"\\"+write_no);
				//true : destDir 디렉터리 생성. false : 디렉터리 생성하지 않음
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
				System.out.println("file created");
			}
			message = "<script>alert('새글을 추가했습니다.');";
			message += " location.href='boardAllList';</script>";
		}else {
			File srcFile = new File(IMAGE_REPO+"\\"+"temp"+"\\"+image_file_name);
			srcFile.delete();
			message = " <script> alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message +=" location.href='writeForm'; </script>";
		}
		return message;
	}
	public void download(int write_no,String image_file_name, 
			HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = IMAGE_REPO + "\\" + write_no +"\\"+image_file_name;
		File file = new File(downFile);
		//Content-disposition :파일 다운로드를 처리하는 HTTP헤더 중 하나다
		//Content-disposition : attachment : attachment는 파일을 다운로드하여 브라우저로 표현 하는 의미다
		//fileName는 파일을 다운로드할때의 이름을 지정해 준다.
		response.addHeader("Content-disposition", "attachment; fileName=" + image_file_name);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {//브라우저로 전송
			int count = in.read(buffer);  
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close(); out.close();
		System.out.println("다운로드 서비스 실행 됨");
	}
	public String getMessage(String deleteChk, int result,int write_no,String originalFile,String newFile) throws Exception {
		System.out.println("deleteChk:"+deleteChk);
		System.out.println("result:"+result);
		System.out.println("write_no:"+write_no);
		System.out.println("originalFile:"+originalFile);
		System.out.println("newFile:"+newFile);
		String message = "<script>";
		if(result != -1) {
			if(newFile.length() != 0) {
				File oldFile = new File(IMAGE_REPO+"\\"+write_no+"\\"+originalFile);
				oldFile.delete();
				
				File srcFile = new File(IMAGE_REPO+"\\"+"temp"+"\\"+newFile);
				File destDir = new File(IMAGE_REPO+"\\"+write_no);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}else if( deleteChk.equals("chk") ) {
				File oldFile = new File(IMAGE_REPO+"\\"+write_no+"\\"+originalFile);
				oldFile.delete();
			}
			message += "alert('글을 수정했습니다.');";
		}else {
			if(newFile.length() != 0) {
				File srcFile = new File(IMAGE_REPO+"\\"+"temp"+"\\"+newFile);
				srcFile.delete();
			}
			message += "alert('오류가 발생했습니다.다시 수정해주세요');";
		}
		message += "location.href='contentView?write_no="+write_no+"';";
		message +=" </script>";
		return message;
	}
	public void boardFileDelete(int write_no) throws Exception {
		File destDir = new File(IMAGE_REPO+"\\"+write_no);
		FileUtils.deleteDirectory(destDir);
	}
}











