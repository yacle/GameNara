package org.game.nara.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
@Autowired
SqlSessionTemplate temp;

	public int check(Map map) {
		return temp.selectOne("member.check", map);
	}
	
	public int addMember(Map map) {
		int r = temp.insert("member.add", map);
		r+= temp.insert("member.add2", map);
		return r;
	}
	
	public int idcheck(String id) {
		return temp.selectOne("member.check", id);
	}
	
	public Map readInfo(String id) {
		return temp.selectOne("member.readInfo", id);
	}
	
	public int addInfo(Map map) {
		return temp.update("member.addInfo", map);
	}
	
	public Map readProfile(String id) {
		return temp.selectOne("member.readProfile", id);
	}
	
	public int addProfile(Map map) {
		return temp.update("member.addProfile", map);
	}
}