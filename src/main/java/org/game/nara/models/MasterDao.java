package org.game.nara.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MasterDao {
@Autowired
SqlSessionTemplate temp;

	public List memberList() {
	return temp.selectList("master.memberList");
	}
	
	public Map memberOne(String id) {
		return temp.selectOne("master.memberOne", id);
	}
	
	public Map report(String id) {
		Map map = new HashMap();
		int r01 = temp.selectOne("master.report01", id);
		map.put("after", r01);
		int r02 = temp.selectOne("master.report02", id);
		map.put("free_distribute", r02);
		int r03 = temp.selectOne("master.report03", id);
		map.put("buy", r03);
		int r04 = temp.selectOne("master.report04", id);
		map.put("freeboard", r04);
		System.out.println(map.toString());
		return map;
	}
}
