package com.syi.project.controller.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.syi.project.model.period.PeriodVO;
import com.syi.project.model.schedule.ScheduleVO;
import com.syi.project.service.schedule.ScheduleService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/admin")
@Log4j2
public class ScheduleController {

	@Autowired
	ScheduleService scheduleService;
	
	/* 시간표 등록 페이지 이동 */
	@GetMapping("/class/enrollSchedule")
	public void scheduleEnrollGET() throws Exception{
		log.info("시간표 등록 페이지 이동");
	}
	
	/* 시간표 등록 */
	@PostMapping("/class/enrollSchedule")
	public void enrollSchedulePOST(ScheduleVO schedule) throws Exception{
		log.info("시간표 등록 기능 시작");

		System.out.println("Received Schedule: " + schedule);
		System.out.println("Received Periods: " + schedule.getPeriods());
		
		scheduleService.enrollSchedule(schedule);
		
	}
}
