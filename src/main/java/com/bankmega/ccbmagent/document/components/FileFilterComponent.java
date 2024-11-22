package com.bankmega.ccbmagent.document.components;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileFilterComponent {

	@Value("${app.filter.max-size}")
	private Integer max;
	
	@Value("#{'${app.filter.file-type}'.split(',')}")
	private List<String> listAllowedType;

	public Boolean isFileAllowed(MultipartFile file) {
		Boolean result = null;
		String fileName = file.getOriginalFilename();

		if (fileName == null) {
			result = false;
		} else {
			result = listAllowedType.stream().anyMatch(fileName.toLowerCase()::endsWith);
		}

		return result;
	}

	public Boolean isFileSizeAllowed(MultipartFile file) {
		Boolean result = true;
		Integer maxSize = max * 1024 * 1024;
		Integer fileSize = (int) file.getSize();

		if (fileSize > maxSize) {
			result = false;
		}

		return result;
	}
}
