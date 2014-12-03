package com.weir.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.weir.dao.MemberDao;
import com.weir.domain.Member;

@Service
public class MemberService {
	@Inject
	private MemberDao memberDao;
	
	public Member findOneByNameAndPass(String name,String pass){
		return memberDao.findOneByNameAndPass(name, pass);
	}
	
}
