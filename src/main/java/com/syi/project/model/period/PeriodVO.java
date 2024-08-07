package com.syi.project.model.period;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PeriodVO {
	
	private int periodNo;
	
	private int scheduleNo;
	
	private String dayOfWeek;
	
	private String periodName;
	
	@DateTimeFormat(pattern = "HH:mm")
	private Date startTime;
	
	@DateTimeFormat(pattern = "HH:mm")
	private Date endTime;
	
}
