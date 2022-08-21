package com.bjscar.rental.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BrokenReportHistory {

	private int brId;
	private String brTitle;
	private String brContent;
	private Date brDate;
	private int memberId;
	
}
