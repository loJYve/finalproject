package com.bjscar.businessman.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Businessman {

   private String bmId;
   private String bmPassword;
   private String companyName;
   private String bmEmail;
   private String bmPhone;
   private String companyAddress;
   private String registrationNumber;
   private Date bmenrollDate;
   private String permissionStatus;
}