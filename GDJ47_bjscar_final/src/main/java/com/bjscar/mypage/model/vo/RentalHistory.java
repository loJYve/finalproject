package com.bjscar.mypage.model.vo;

import java.util.Date;

import com.bjscar.vehicle.model.vo.Vehicle;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RentalHistory {
	private int rentalId;
	private Date rentalDate;
	private Date returnDate;
}
