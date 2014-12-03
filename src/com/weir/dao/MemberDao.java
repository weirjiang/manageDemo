package com.weir.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.weir.db.BaseDao;
import com.weir.domain.Member;
@Repository
public class MemberDao extends BaseDao<Member>{
	public Member findOneByNameAndPass(String name,String pass){
		Query query  = em.createQuery("from Member where memberName=:name and password=:pass");
		query.setParameter("name", name);
		query.setParameter("pass", pass);
		List<Member> list = query.getResultList();
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
}
