package com.bjscar.vehicle.model.vo;

import com.bjscar.rentalshop.model.vo.RentalshopAttachment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class VehicleAttachment {
	
	private int vehicleId;
	private int attachmentId;
}
