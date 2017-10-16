package org.game.nara.models;

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
		return tmp.selectOne("freeB.readOne", num);
	}
	
	public int addPoint() {
		return tmp.update("freeB.addPoint");
	}
}