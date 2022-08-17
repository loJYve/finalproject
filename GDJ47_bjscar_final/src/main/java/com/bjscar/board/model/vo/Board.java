package com.bjscar.board.model.vo;

import java.sql.Date;
import java.util.List;

import com.bjscar.attachment.model.vo.Attachment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int ibPostId;
	private String ibPostTitle;
	private String ibPostWriter;
	private Date ibPostDate;
	private String ibPostCategory;
	private String ibPostContent;
	private List<Attachment> files;
}
