package com.bjscar.mypage.model.vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PurchaseDataList {

	private int purchaseId;
	private Date bookingDate;
	private String model;
	private String status;
	private int amount;
}
