package com.bjscar.plan.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Plan {
  private int planId;
  private String planTitle;
  private Date planDate;
  private String planTheme;
  private String planArea;
  private Date planDate2;
  private String phone;
}
