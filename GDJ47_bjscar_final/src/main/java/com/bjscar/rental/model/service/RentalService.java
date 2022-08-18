package com.bjscar.rental.model.service;

import java.util.List;
import java.util.Map;

import com.bjscar.vehicle.model.vo.Vehicle;

public interface RentalService {

	List<Vehicle> searchVehicleByGrade(Map param);

	int selectSearchvehicleCount(String vehicleGrade);

}
