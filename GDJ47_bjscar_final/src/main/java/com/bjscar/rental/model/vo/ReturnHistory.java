package com.bjscar.rental.model.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReturnHistory {
	
	private int returnId;
	private Timestamp returnCompletionDate;
	private int rentalId;
	private String accidentStatus;
	
}
