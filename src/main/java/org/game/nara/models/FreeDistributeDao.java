package org.game.nara.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeDistributeDao {

	@Autowired
	SqlSessionTemplate tmp;
	
	public List<Map> listAll() {
		return tmp.selectList("freeD.listAll");
	}
	
	public boolean addOne(Map map) {
		tmp.insert("freeD.addOne", map);
		return true;
	}
	
	public Map readOne(String num) {
		tmp.update("freeD.countOne",num);
		return tmp.selectOne("freeD.readOne", num);
	}
	
	public int endSet (Map map) {
		return tmp.update("freeD.endSet",map);
	}
}
