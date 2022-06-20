package com.hmall.team04.controller.file;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hmall.team04.dto.file.FileDTO;
import com.hmall.team04.dto.review.ReviewDTO;
import com.hmall.team04.service.file.FileServiceImpl;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/aws")
public class FileController {
	
	@Autowired
	private FileServiceImpl awsS3Service;
	
	@RequestMapping(value = "/uploadS3", method= {RequestMethod.POST})
	@ResponseBody
	public void uploadS3(ReviewDTO reviewDTO) throws Exception {
//		log.info(fileDTO.toString());
//		MultipartFile file = fileDTO.getUploadfile();
//		log.info(file);
		
		awsS3Service.s3FileUpload(reviewDTO);
		
	}
	
}
