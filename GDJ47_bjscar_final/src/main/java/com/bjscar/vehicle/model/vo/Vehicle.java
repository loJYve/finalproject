package com.bjscar.vehicle.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Vehicle {
	
	private int vehicleId;
	private String model;
	private String numberPlate;
	private String rentalStatus;
	private int productYear;
	private int rentalshopId;
	private String accidentStatus;
	private int price;
	private String fuel;
	private int boardingPersonnel;
	private String vehicleGrade;
	
}
