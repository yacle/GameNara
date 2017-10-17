package org.game.nara.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExchangeDao {
	@Autowired
	SqlSessionTemplate template;

	public List<Map> readAll() {
		return template.selectList("exchange.list");
	}
	
	public List<Map> consoleread() {
		return template.selectList("exchange.consoleread");

	}
	public List<Map> titleread() {
		return template.selectList("exchange.titleread");

	}
	public List<Map> accessoryread() {
		return template.selectList("exchange.accessoryread");

	}
	
	public List<Map> othersread() {
		return template.selectList("exchange.othersread");
	}
	public int endset (Map map) {
		return template.update("exchange.endset",map);
	}
	
	
	public boolean addOne(Map map) {
		template.insert("exchange.add", map);
		return true;
	}

	public Map readOne(String num) {
		return template.selectOne("exchange.readOne", num);
	}

	public int countup(String num) {
		return template.update("exchange.countup",num);
	}
}
