package org.game.nara.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import freemarker.template.Template;

@Repository
public class buyDao {
	@Autowired
	SqlSessionTemplate template;

	public List<Map> readAll() {
		return template.selectList("board.raeaAll");
	}

	public boolean addOne(Map map) {
		template.insert("board.addOne", map);
		return true;
	}

	public Map readOne(String num) {
		return template.selectOne("board.readOne", num);
	}

}
