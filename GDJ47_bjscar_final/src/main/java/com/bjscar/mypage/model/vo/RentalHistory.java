package com.bjscar.mypage.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RentalHistory {
	private int rentalId;
	private Timestamp rentalDate;
	private Timestamp returnDate;
	private String status;
	private int vehicleId;
	private String memberId;
	private Date bookingDate;
	private String insuranceCode;
}
