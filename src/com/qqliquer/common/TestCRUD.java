package com.qqliquer.common;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.KeyedHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.junit.Test;

import com.qqliquer.entity.Account;
import com.qqliquer.service.AccountService;
import com.qqliquer.service.impl.AccountServiceImpl;

public class TestCRUD {
	@Test
	public void testQuery() throws Exception {
		QueryRunner query = new QueryRunner();
		List<Account> account = query.query(DBUtils.getConnection(),
				"select * from account", new BeanListHandler<Account>(
						Account.class));
		for (Account a : account) {
			System.out.println(a.toString());
		}
	}

	@Test
	public void test2() throws Exception {
		QueryRunner query = new QueryRunner();
		List<Object[]> list = query.query(DBUtils.getConnection(),
				"select * from account", new ArrayListHandler());
		for (Object[] a : list) {
			for (Object obj : a) {
				System.out.print(obj);
				System.out.print("\t");
			}
			System.out.println();
		}
	}

	@Test
	public void test3() throws Exception {

		QueryRunner query = new QueryRunner();
		Map<Object, Map<String, Object>> map1 = query.query(
				DBUtils.getConnection(), "select * from account",
				new KeyedHandler<Object>());
		for (Entry<Object, Map<String, Object>> map : map1.entrySet()) {
			for (Map.Entry<String, Object> zx : map.getValue().entrySet()) {
				System.out.println(zx.getKey() + "\t" + zx.getValue());
			}
		}
	}

	public void test4() throws Exception {

		QueryRunner query = new QueryRunner();
		Map<String, Object> map = query.query(DBUtils.getConnection(),
				"select * from account", new MapHandler());

	}

	@Test
	public void test5() {
		AccountService s = new AccountServiceImpl();
		try {
			s.update("liwei", "chenguang", 100);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
