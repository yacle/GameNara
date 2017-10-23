package org.game.nara.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellDao {
@Autowired
SqlSessionTemplate temp;

	public int sellAdd(Map map) {
		return temp.insert("sell.add", map);
	}
	public int subtractPoint(String id) {
		return temp.update("sell.subtractPoint", id);
	}
	
	public List sellList() {
		return temp.selectList("sell.sellList");
	}
	public List sellConsole() {
		return temp.selectList("sell.console");
	}
	public List sellTitle() {
		return temp.selectList("sell.title");
	}
	public List sellAcce() {
		return temp.selectList("sell.acce");
	}
	public List sellOther() {
		return temp.selectList("sell.other");
	}
}
