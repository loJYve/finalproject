package com.bjscar.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Admin {
	private String adminId;
	private String adminName;
	private String adminEmail;
	private String adminPhone;
	private Date enrollDate;

}
