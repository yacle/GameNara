package org.game.nara.models;

import java.util.*;

import org.game.nara.controllers.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao extends MemberVO{
@Autowired
SqlSessionTemplate temp;


	public MemberVO check(MemberVO vo) {
		return temp.selectOne("member.check", vo);
	}
	
<<<<<<< HEAD
	public void logcnt(String id) {
		temp.update("member.logcnt", id);
	}
	
	public int addMember(Map map) {
		int r = temp.insert("member.add", map);
		r+= temp.insert("member.add2", map);
=======
	public int addMember(MemberVO vo) {
		int r = temp.insert("member.add", vo);
		r+= temp.insert("member.add2", vo);
>>>>>>> branch 'master' of https://github.com/yacle/GameNara.git
		return r;
	}
	
	public int idcheck(String id) {
		return temp.selectOne("member.idcheck", id);
	}
	
	public int nickcheck(String nick) {
		return temp.selectOne("member.nickcheck", nick);
	}
	
	public MemberVO readInfo(MemberVO vo) {
		return temp.selectOne("member.readInfo", vo);
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
