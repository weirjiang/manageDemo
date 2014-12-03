package com.weir.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author weir.jiang
 *
 */
@Entity
public class Dealer implements Serializable {

	@Override
	public String toString() {
		return "Dealer [id=" + id + ", payee=" + payee + ", bank=" + bank
				+ ", account=" + account + ", brand=" + brand
				+ ", createdTime=" + createdTime + ", updateTime=" + updateTime
				+ "]";
	}
	private static final long serialVersionUID = 1L;

	/**
	 * Id
	 */
	@Id
	private String id;
	
	/**
	 * 收款人
	 */
	private String payee;
	/**
	 * 开户行
	 */
	private String bank;
	/**
	 * 账号
	 */
	private String account;
	/**
	 * 品牌
	 */
	private String brand;
	/**
	 * 联系人
	 */
	private String contact;
	/**
	 * 联系电话
	 */
	private String telPhone;

	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getTelPhone() {
		return telPhone;
	}
	public void setTelPhone(String telPhone) {
		this.telPhone = telPhone;
	}
	@Temporal(TemporalType.TIMESTAMP) 
	@Column(name = "createdTime")
	private Date createdTime;
	@Temporal(TemporalType.TIMESTAMP) 
	@Column(name = "updateTime")
	private Date updateTime;

	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Dealer(String id, String payee, String bank, String account,
			String brand) {
		super();
		this.id = id;
		this.payee = payee;
		this.bank = bank;
		this.account = account;
		this.brand = brand;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPayee() {
		return payee;
	}
	public void setPayee(String payee) {
		this.payee = payee;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public Dealer() {
		super();
		// TODO Auto-generated constructor stub
	}
}
