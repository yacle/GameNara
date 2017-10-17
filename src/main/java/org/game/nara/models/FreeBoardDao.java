package org.game.nara.models;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDao {

	@Autowired
	SqlSessionTemplate tmp;
	
	public List<Map> listAll() {
		return tmp.selectList("freeB.listAll");
	}
	
	public boolean addOne(Map map) {
		tmp.insert("freeB.addOne", map);
		return true;
	}

	public Map readOne(String num) {
		tmp.update("freeB.countOne",num);
		Map map = new HashMap();
		List list =tmp.selectList("reply.readReply",num);
		Map m = tmp.selectOne("freeB.readOne", num);
		map.put("reply", list);
		map.put("one", m);
		return map;
	}
	
	public int addPoint(String id) {
		return tmp.update("freeB.addPoint",id);
	}
	

	public int subPoint(String id) {
		return tmp.update("freeB.subPoint",id);
	}
	
	public int upLevel(String id) {
		return tmp.update("freeB.upLevel",id);
	}
}
