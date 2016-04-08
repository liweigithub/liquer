package com.qqliquer.service.impl;

import com.qqliquer.common.TransactionManage;
import com.qqliquer.dao.AccountDao;
import com.qqliquer.dao.impl.AccountDaoImpl;
import com.qqliquer.entity.Account;
import com.qqliquer.service.AccountService;

public class AccountServiceImpl implements AccountService {
	AccountDao dao = new AccountDaoImpl();

	
	public void update(String fromUserName, String toUserName, double money) {

		try {
			TransactionManage.begin();
			Account fromAccount = dao.findAccountByName(fromUserName);
			fromAccount.setMoney(fromAccount.getMoney() - money);
			Account toAccount = dao.findAccountByName(toUserName);
			toAccount.setMoney(toAccount.getMoney() + money);
			dao.update(fromAccount);
			dao.update(toAccount);
			TransactionManage.commit();
		} catch (Exception e) {
			e.printStackTrace();
			TransactionManage.rollback();
		}
	}
}
