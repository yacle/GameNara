package org.game.nara.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class becomeDao {
	@Autowired
	SqlSessionTemplate template;

	public List<Map> readAll() {
		return template.selectList("become_member.list");
	}
	
	public boolean addOne(Map map) {
		template.insert("become_member.add", map);
		return true;
	}
}
