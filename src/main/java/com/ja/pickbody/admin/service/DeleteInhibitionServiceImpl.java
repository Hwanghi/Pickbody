package com.ja.pickbody.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.ja.pickbody.admin.mapper.AdminSQLMapper;

@Service
@EnableScheduling
public class DeleteInhibitionServiceImpl {

	@Autowired
	private AdminSQLMapper adminSQLMapper;
	
	//시간 되면 회원 로그인 금지 해제
	@Scheduled(cron = "* 30 * * * *")
	public void deleteMemberInhibition() {
		adminSQLMapper.deleteMemberInhibition();
	}
}
