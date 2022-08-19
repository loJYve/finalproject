package com.bjscar.rental.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PurchaseHistory {
	
	private int purchaseId;
	private int purchaseAmount;
	private int addMileage;
	private int useMileage;
	private String purchaseMethod;

}
