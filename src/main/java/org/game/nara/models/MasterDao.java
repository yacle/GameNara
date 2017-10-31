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
	
	public Map reportCount(String id) {
		Map map = new HashMap();
		int r01cnt = temp.selectOne("master.aftercnt", id);
		int r02cnt = temp.selectOne("master.freediscnt", id);
		int r03cnt = temp.selectOne("master.buycnt", id);
		int r04cnt = temp.selectOne("master.freecnt", id);
		int r05cnt = temp.selectOne("master.sellcnt", id);
		int r07cnt = temp.selectOne("master.replycnt", id);
		int r06cnt = temp.selectOne("master.logcnt", id);
		map.put("aftercnt", r01cnt);
		map.put("free_distributecnt", r02cnt);
		map.put("buycnt", r03cnt);
		map.put("freeboardcnt", r04cnt);
		map.put("sellcnt", r05cnt);
		map.put("replycnt", r07cnt);
		map.put("logcnt", r06cnt);
		return map;
	}
	
	public Map reportData(String id) {
		Map map = new HashMap();
		
		List r01 = temp.selectList("master.after", id);
		List r02 = temp.selectList("master.freedis", id);
		List r03 = temp.selectList("master.buy", id);
		List r04 = temp.selectList("master.free", id);
		List r05 = temp.selectList("master.sell", id);
		List r07 = temp.selectList("master.reply", id);
		map.put("after", r01);
		map.put("free_dist", r02);
		map.put("buy", r03);
		map.put("freeboard", r04);
		map.put("sell", r05);
		map.put("reply", r07);
		return map;
	}
}
