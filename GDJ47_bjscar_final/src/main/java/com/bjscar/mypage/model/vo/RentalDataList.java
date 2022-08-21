package com.bjscar.mypage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RentalDataList {

	private String carImage;
	private String model;
	private Date rentalDate;
	private String rentalshopName;
	private Date returnDate;
	private String status;
	private int rentalId;
	
}
