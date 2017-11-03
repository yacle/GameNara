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
	
	public List sellData(String id) {
		return temp.selectList("master.sell", id);
	}
	public List buyData(String id) {
		return temp.selectList("master.buy", id);
	}
	public List freedistData(String id) {
		return temp.selectList("master.freedis", id);
	}
	public List freeData(String id) {
		return temp.selectList("master.free", id);
	}
	public List afterData(String id) {
		return temp.selectList("master.after", id);
	}
	
	public int levelChange(Map map) {
		return temp.update("master.level", map);
	}
}	
