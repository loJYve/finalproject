package com.bjscar.attachment.model.vo;

import java.util.Date;
import java.util.List;

import com.bjscar.board.model.vo.Board;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Attachment {

	private int attachmentId;
	private String attachmentTitle;
	private String originalFilename;
	private String renamedFilename;
	private Date attchamentDate;
	private int boardNo;
}
