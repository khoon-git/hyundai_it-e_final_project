package com.hmall.team04.service.file;


import org.springframework.web.multipart.MultipartFile;

import com.hmall.team04.dto.file.FileDTO;
import com.hmall.team04.dto.review.ReviewDTO;


public interface FileService {

	public void s3FileUpload(ReviewDTO reviewDTO) throws Exception;

}
