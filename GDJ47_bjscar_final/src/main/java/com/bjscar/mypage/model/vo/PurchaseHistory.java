package com.bjscar.mypage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PurchaseHistory {

	private int purchaseId;
	private Date bookingDate;
	private String model;
	private String status;
	private	String purchaseAmount;
}
