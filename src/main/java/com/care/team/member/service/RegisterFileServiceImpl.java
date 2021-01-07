package com.care.team.member.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.team.member.data.RegisterDAO;

@Service
public class RegisterFileServiceImpl implements RegisterFileService{
	
	@Autowired RegisterDAO dao;

	//final String Path = 
	//	"D:\\java_home\\TeamProject_CC\\team\\src\\main\\webapp\\resources\\profile";
	
	public Map<String, Object> profileData(
		MultipartHttpServletRequest multipart, String userId, String Path) {
		
		try {
			multipart.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> profileMap = new HashMap<String, Object>();
		Enumeration enu = multipart.getParameterNames();
		while(enu.hasMoreElements()) { 
			String name = (String)enu.nextElement();
			String value = multipart.getParameter(name);
			//System.out.println(name + " : " + value);
			profileMap.put(name, value);
		}
		
		String profileName = profileUpload(multipart, userId, Path);
		//System.out.println("profileName : "+profileName);
		
		profileMap.put("profileName",profileName);
		return profileMap;
	}
	
	private String profileUpload(
		MultipartHttpServletRequest multipart, String userId, String Path) {
		
		MultipartFile imgFile = multipart.getFile("profile_img");
		
		String originalFilename = imgFile.getOriginalFilename(); // fileName.jpg
		String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName 확장자제외
		String extension = originalFilename.substring(originalFilename.indexOf(".")); //.jpg 확장자
		String profileName = onlyFileName + "_" + multipart.getParameter("id") + extension; // fileName_id.jpg   
		
		//System.out.println("<----- 변경하는 이미지파일 ----->");
		//System.out.println("originalFilename : "+originalFilename);
		//System.out.println("onlyFileName : "+onlyFileName);
		//System.out.println("extension : "+extension);
		//System.out.println("profileName : "+profileName);
		
		System.out.println(Path);
		
	    File file = new File(Path);
	    if(!file.exists()) {
	    	file.getParentFile().mkdirs();	
	    }
	    if(extension.equals(".jpg") || extension.equals(".gif") || extension.equals(".png")) {
	    	if(!imgFile.isEmpty()) {
		    	
		    	String profile = dao.getProfile_Img(userId);
		    	
		    	//System.out.println("<----- 기존파일명 ----->");
		    	//System.out.println("profile : "+profile);
		    	
		    	if(!profile.equals("없음") || !profile.equals("확장자오류")) {
		    		
		    		profileDelete(Path,userId,profile);
		    		int deleteResult = dao.deleteProfile_Img(userId);
		    		System.out.println("deleteResult : "+deleteResult);
		    		
		    	}
		    	
		    	try {
					imgFile.transferTo(new File(Path+"\\"+profileName)); //파일생성
				} catch (Exception e) {
					e.printStackTrace();
				}	
		    }else {
		    	profileName = "없음";
		    }
	    }else {
	    	profileName = "확장자오류";
	    }
	    
		return profileName;
	}

	private void profileDelete(String Path, String userId, String profile) {
		File file = new File(Path+"\\"+userId+"\\"+profile);
		if(file.exists()) {
			file.delete();
		}
		
	}

	public String getMessage(
		int result, String userId, String profileName, String b_Profile, String Path) throws Exception {
		String message = null;
		if(result != -1) {
			if(b_Profile.equals(profileName)) {
				
				File srcFile = new File(Path+"\\"+profileName);
				srcFile.delete();
				
				message = "<script>";
				message += "alert('동일한 파일입니다');";
				message += "location.href='profile?id="+userId+"';";
				message += "</script>";
				
			}else {
				if(profileName != null && profileName.length() != 0) {
					File srcFile = new File(Path+"\\"+profileName);
					File destDir = new File(Path+"\\"+userId);
					//true : destDir 디렉터리 생성. false : 디렉터리 생성하지 않음
					
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
					
					message = "<script>";
					message += "alert('이미지가 변경되었습니다.');";
					message += "location.href='profile?id="+userId+"';";
					message += "</script>";
				}else {
					
					File srcFile = new File(Path+"\\"+profileName);
					srcFile.delete();
					
					message = "<script>";
					message += "alert('파일이 없습니다.');";
					message += "location.href='profile?id="+userId+"';";
					message += "</script>";
				}
			}
			
		}else {
		
			File srcFile = new File(Path+"\\"+profileName);
			srcFile.delete();
			message = "<script>";
			message += "alert('오류가 발생하였습니다. 다시 시도해주세요');";
			message += " location.href='profile?id="+userId+"';";
			message += "</script>";
		}
		return message;
	}

	@Override
	public void userDirdelete(String userId, String Path) {
		File folder = new File(Path+"\\"+userId);
		try {
		    while(folder.exists()) {
		    	
			File[] folder_list = folder.listFiles(); //파일리스트 얻어오기
					
			for (int j = 0; j < folder_list.length; j++) {
				folder_list[j].delete(); //파일 삭제 
				//System.out.println("파일이 삭제되었습니다.");		
			}
					
			if(folder_list.length == 0 && folder.isDirectory()){ 
				folder.delete(); //대상폴더 삭제
				//System.out.println("폴더가 삭제되었습니다.");
			}
	            }
		 } catch (Exception e) {
			e.printStackTrace();
		 }
	}

	@Override
	public void profileDownload(Model model, String userId, String Path, 
			HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String fileName = dao.getProfile_Img(userId);
		String downFile = Path + "\\" + userId+"\\"+fileName;
		File file = new File(downFile);
		//Content-disposition :파일 다운로드를 처리하는 HTTP헤더 중 하나다
		//Content-disposition : attachment : attachment는 파일을 다운로드하여 브라우저로 표현 하는 의미다
		//fileName는 파일을 다운로드할때의 이름을 지정해 준다.
		response.addHeader("Content-disposition", "attachment; fileName=" + fileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[10 * 1024 * 1024];
		while (true) {//브라우저로 전송
			int count = in.read(buffer);
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close(); out.close();
		System.out.println("다운로드 서비스 실행 됨");
		
	}

}
