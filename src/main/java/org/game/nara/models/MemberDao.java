package org.game.nara.models;

import java.util.*;

import org.game.nara.controllers.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
@Autowired
SqlSessionTemplate temp;


	public Map check(Map map) {
		return temp.selectOne("member.check", map);
	}
	
	public int addMember(Map map) {
		int r = temp.insert("member.add", map);
		r+= temp.insert("member.add2", map);
		return r;
	}
	
	public int idcheck(String id) {
		return temp.selectOne("member.idcheck", id);
	}
	
	public int nickcheck(String nick) {
		return temp.selectOne("member.nickcheck", nick);
	}
	
	public MemberVO readInfo(String id) {
		return temp.selectOne("member.readInfo", id);
	}
	
	public int addInfo(Map map) {
		int r =temp.update("member.emailReg1", map);
		r+=temp.update("member.addInfo", map);
		return r;
	}
	
	public Map readProfile(String id) {
		return temp.selectOne("member.readProfile", id);
	}
	
	public int addProfile(Map map) {
		return temp.update("member.addProfile", map);
	}
	
	public int emailReg(Map map) {
		return temp.update("member.emailReg2", map);
	}
}
