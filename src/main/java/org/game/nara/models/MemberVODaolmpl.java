package org.game.nara.models;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.game.nara.controllers.MemberVO;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Repository

public class MemberVODaolmpl implements MemberVODAO{

	@Inject
	private SqlSession session;
	
	@Override
	public void create(MemberVODAO vo) throws Exception {
		session.insert("member.add",vo);
		
	}

	@Override
	public MemberVODAO read(String id) throws Exception {
		return session.selectOne("member.readInfo");
	}

	@Override
	public void update(MemberVODAO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MemberVODAO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}