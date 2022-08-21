package com.bjscar.rental.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OverdueHistory {
	
	private int overdueId;
	private int overdueFee;
	private int rentalId;
	private int returnId;
	private double overdueTime;

}
