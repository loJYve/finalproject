package com.bjscar.rental.model.service;

import java.util.List;

import com.bjscar.vehicle.model.vo.Vehicle;

public interface RentalService {

	List<Vehicle> searchVehicleByGrade(String vehicleGrade);

}
