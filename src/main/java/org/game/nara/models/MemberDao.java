package org.game.nara.models;

import java.util.*;

import org.game.nara.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao extends MemberVO{
@Autowired
SqlSessionTemplate temp;


	public MemberVO check(MemberVO vo) throws Exception {
		temp.update("member.logcnt", vo);
		return temp.selectOne("member.check", vo);
	}
	
	public int addMember(MemberVO vo) throws Exception {
		int r = temp.insert("member.add", vo);
		r+= temp.insert("member.add2", vo);
		return r;
	}
	
	public int idcheck(String id) throws Exception {
		return temp.selectOne("member.idcheck", id);
	}
	
	public int nickcheck(String nick) throws Exception {
		return temp.selectOne("member.nickcheck", nick);
	}
	
	public int pointcheck(String id) throws Exception {
		return temp.selectOne("member.pointcheck", id);
	}
	
	public int levelcheck(String id) throws Exception {
		return temp.selectOne("member.levelcheck", id);
	}
	
	public MemberVO readInfo(MemberVO vo) throws Exception {
		return temp.selectOne("member.readInfo", vo);
	}
	
	public int addInfo(Map map) throws Exception {
		int r =temp.update("member.emailReg1", map);
		r+=temp.update("member.addInfo", map);
		return r;
	}
	
	public Map readProfile(String id) throws Exception {
		return temp.selectOne("member.readProfile", id);
	}
	
	public int addProfile(MemberVO vo) throws Exception {
		return temp.update("member.addProfile", vo);
	}
	
	public int emailReg(Map map) throws Exception {
		return temp.update("member.emailReg2", map);
	}
}
