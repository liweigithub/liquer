package com.qqliquer.dao;

import com.qqliquer.entity.Account;

public interface AccountDao {
	public void update(Account account) throws Exception;
	public Account findAccountByName(String name) throws Exception;
}
