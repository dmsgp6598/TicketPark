package ticket.common;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "C:\\spring_tool\\TicketPark\\src\\main\\webapp\\WEB-INF\\poster\\";
	
	public List<Map<String, Object>> parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		
		File file = new File(filePath);
		
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				//originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				file = new File(filePath + originalFileName);
				multipartFile.transferTo(file);
				
				listMap = new HashMap<String, Object>();
				listMap.put("IMAGE_NAME", originalFileName);
				/*
				 * listMap = new HashMap<String,Object>(); listMap.put("BOARD_IDX", boardIdx);
				 * listMap.put("ORIGINAL_FILE_NAME", originalFileName);
				 * listMap.put("STORED_FILE_NAME", storedFileName); listMap.put("FILE_SIZE",
				 * multipartFile.getSize());
				 */
				list.add(listMap);
			}
		}
		return list;
	}

}