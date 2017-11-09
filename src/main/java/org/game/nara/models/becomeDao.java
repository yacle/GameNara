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

	public List<Map> readAll() throws Exception {
		return template.selectList("become_member.list");
	}
	
	public int addOne(Map map) throws Exception {
		return template.insert("become_member.add", map);
	}

	public Map readOne(String num) throws Exception {
		template.update("become_member.countup",num);
		return template.selectOne("become_member.readOne", num);
		}
	
	public int delete(Map num) throws Exception {
		return template.delete("become_member.delete",num);
	}
	
	public int adjust (Map map) throws Exception {
		return template.update("become_member.adjust",map);
	}
	
	public int levelboard(Map map) throws Exception {
		return template.update("become_member.levelboard", map);
	}
	
	public List<LevelReqVO> levelReqList() throws Exception {
		return template.selectList("become_member.levelReqList");
	}
	
	public int leverReqAdd(LevelReqVO vo) throws Exception {
		return template.insert("become_member.levelboard", vo);
	}
	
	public int leverReqDel(Object no) throws Exception {
		return template.delete("become_member.levelReqDel", no);
	}
}
