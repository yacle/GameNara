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


	public Map readOne(String num) {
		template.update("become_member.countup",num);
		return template.selectOne("become_member.readOne", num);
		}
	
	public int delete(Map num) {
		return template.delete("become_member.delete",num);
	}
	
	public int adjust (Map map) {
		return template.update("become_member.adjust",map);
	}
}
