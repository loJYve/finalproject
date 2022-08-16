package com.bjscar.rentalshop.model.vo;


import java.util.List;

import com.bjscar.attachment.model.vo.Attachment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Rentalshop {

	private int rentalshopId;
	private String rentalshopName;
	private String rentalshopAddr;
	private double latitude;
	private double longitude;
	private String bmMember;	
	private List<Attachment> file;

}
