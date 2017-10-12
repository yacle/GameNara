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
	
	public int buyadd(Map map) {
		return template.insert("buy.add", map);
	}

	public List<Map> readAll() {
	return template.selectList("buy.list");
	}

	public Map readOne(String num) {
		return template.selectOne("board.readOne", num);
	}

}
