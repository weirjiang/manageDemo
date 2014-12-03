package com.weir.dao;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.weir.db.BaseDao;
import com.weir.domain.Dealer;
@Repository
public class DealerDao extends BaseDao<Dealer>{
	
	public List<Dealer> listAll(){
		String hql = "from Dealer";
		Query query =em.createQuery(hql);
		List<Dealer> list = query.getResultList();
	    return list;
	}
	
	public Dealer getDealerByPayee(String payee){
		String hql = "from Dealer where payee=?1";
		Query query =em.createQuery(hql);
		query.setParameter(1, payee);
		List<Dealer> list = query.getResultList();
		Dealer dealer = new Dealer();
		if(list!=null){
			dealer = list.get(0);
		}
		return dealer;
	}
	
	public List<Dealer> list(Integer offset,Integer fetchSize){
		String hql = "from Dealer";
		Query query =em.createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(fetchSize);
		List<Dealer> list = query.getResultList();
	    return list;
	}
}
