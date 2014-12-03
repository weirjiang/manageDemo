package com.weir.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weir.dao.DealerDao;
import com.weir.domain.Dealer;

@Service
public class DealerService {
	@Inject
	private DealerDao dealerDao;
	@Transactional
	public void delete(String id){
		Dealer entity = dealerDao.findOne(id);
		dealerDao.delete(entity);
	}
	@Transactional
	public void delete(Dealer entity){
		dealerDao.delete(entity);
	}
	@Transactional
	public Dealer save(Dealer entity){
		return dealerDao.save(entity);
	}
	
	public List<Dealer> listAll(){
		return dealerDao.listAll();
	}
	@Transactional
	public void batchsave(List<Dealer> list){
		dealerDao.batchsave(list);
	}
	
	public Dealer getDealerByPayee(String payee){
		return dealerDao.getDealerByPayee(payee);
	}
	
	public Dealer findOne(String id){
		return dealerDao.findOne(id);
	}
	@Transactional
	public void update(Dealer entity){
		dealerDao.update(entity);
	}
		
	public List<Dealer> list(Integer offset,Integer fetchSize){
		return dealerDao.list(offset, fetchSize);
	}
	public int size(){
		return listAll().size();
	}
}
