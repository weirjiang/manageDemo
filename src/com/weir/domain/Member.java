package com.weir.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Member {
	@Id
	private String id;
	private String memberName;
	private String password;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword() {
		return password;
	}
	public Member() {
		super();
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", memberName=" + memberName
				+ ", password=" + password + ", getId()=" + getId()
				+ ", getMemberName()=" + getMemberName() + ", getPassword()="
				+ getPassword() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	public Member(String id, String memberName, String password) {
		super();
		this.id = id;
		this.memberName = memberName;
		this.password = password;
	}

 
}
