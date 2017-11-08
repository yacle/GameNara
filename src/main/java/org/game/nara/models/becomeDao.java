package org.game.nara.models;

import java.util.List;
import java.util.Map;

import org.game.nara.LevelReqVO;
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
	
	public int addOne(Map map) {
		return template.insert("become_member.add", map);
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
	
	public int levelboard(Map map) {
		return template.update("become_member.levelboard", map);
	}
	
	public List<LevelReqVO> levelReqList(){
		return template.selectList("become_member.levelReqList");
	}
	
	public int leverReqAdd(LevelReqVO vo) {
		return template.insert("become_member.levelboard", vo);
	}
	
	public int leverReqDel(Object no) {
		return template.delete("become_member.levelReqDel", no);
	}
}
