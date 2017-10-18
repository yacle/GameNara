package org.game.nara.models;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class buyDao {
	@Autowired
	SqlSessionTemplate template;

	public List<Map> readAll() {
		return template.selectList("buy.list");
	}
	
	public List<Map> consoleread() {
		return template.selectList("buy.consoleread");

	}
	public List<Map> titleread() {
		return template.selectList("buy.titleread");

	}
	public List<Map> accessoryread() {
		return template.selectList("buy.accessoryread");

	}
	
	public List<Map> othersread() {
		return template.selectList("buy.othersread");
	}
	public int endset (Map map) {
		return template.update("buy.endset",map);
	}
	
	
	public boolean addOne(Map map) {
		template.insert("buy.add", map);
		return true;
	}

		public Map readOne(String num) {
			template.update("buy.countup",num);
			Map map = new HashMap();
			List list =template.selectList("reply.readReply",num);
			Map m = template.selectOne("buy.readOne", num);
			map.put("reply", list);
			map.put("one", m);
			return map;
		}

	public int countup(String num) {
		return template.update("buy.countup",num);
	}
}
