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
		
		int r01 = temp.selectOne("master.aftercnt", id);
		int r02 = temp.selectOne("master.freediscnt", id);
		int r03 = temp.selectOne("master.buycnt", id);
		int r04 = temp.selectOne("master.freecnt", id);
		int r05 = temp.selectOne("master.sellcnt", id);
		int r06 = temp.selectOne("master.logcnt", id);
		map.put("after", r01);
		map.put("free_distribute", r02);
		map.put("buy", r03);
		map.put("freeboard", r04);
		map.put("sell", r05);
		map.put("logcnt", r06);
		return map;
	}
}
