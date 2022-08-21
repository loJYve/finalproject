package com.bjscar.rental.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReturnPurchaseHistory {

	private int returnId;
	private int purchaseId;
	
}
