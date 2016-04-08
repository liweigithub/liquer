package com.qqliquer.entity;

import java.util.Date;

public class Account {
	private String name;
	private double money;
	private Date birthday;

	public Account() {

	}

	public Account(String name, double money) {
		super();
		this.name = name;
		this.money = money;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Override
	public String toString() {
		return "Account [name=" + name + ", money=" + money + ", birthday="
				+ birthday + "]";
	}

}
