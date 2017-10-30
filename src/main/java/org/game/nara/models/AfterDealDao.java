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
	
	public Map readAfter(String no) {
		int r = temp.update("after.cnt", no);
		return temp.selectOne("after.detail", no);
	}
	
	public List listAfter() {
		return temp.selectList("after.list");
	}
	
	public int addPoint(String id) {
		return temp.insert("after.addPoint", id);
	}
	
	
	public int modifyAfter(Map map) {
		return temp.update("after.modifyAfter", map);
	}
}
