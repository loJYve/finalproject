package com.bjscar.attachment.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Attachment {

	private int attachmentId;
	private String attachmentTitle;
	private Date attchamentDate;
	private String originalFilename;
	private String renamedFilename;
	
}
