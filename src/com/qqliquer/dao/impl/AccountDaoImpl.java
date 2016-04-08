package com.qqliquer.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.qqliquer.common.TransactionManage;
import com.qqliquer.dao.AccountDao;
import com.qqliquer.entity.Account;

public class AccountDaoImpl implements AccountDao {

	public void update(Account account) throws Exception {
		QueryRunner run = new QueryRunner();
		run.update(TransactionManage.getConnection(),
				"update account set money=? where name=?", account.getMoney(),
				account.getName());
	}

	
	public Account findAccountByName(String name) throws Exception {
		QueryRunner run = new QueryRunner();
		return run.query(TransactionManage.getConnection(),
				"select * from account where name=?", new BeanHandler<Account>(
						Account.class), name);
	}
}
