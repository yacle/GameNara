package org.game.nara.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AfterDealDao {
@Autowired
SqlSessionTemplate temp;

	public int addAfter(Map map) {
		return temp.insert("after.add", map);
	}
	
	public List listAfter() {
		return temp.selectList("after.list");
	}
}