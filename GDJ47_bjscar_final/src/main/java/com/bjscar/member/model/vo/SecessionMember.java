package com.bjscar.member.model.vo;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SecessionMember {

	private String secessionId;
	private String secessionReason;
	private Date secessionDate;
	private String memberId;
	
	private String type;
    private String keyword;
}
