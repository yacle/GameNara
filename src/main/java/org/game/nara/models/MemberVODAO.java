package org.game.nara.models;

import java.util.List;

import org.game.nara.controllers.MemberVO;


public interface MemberVODAO{

	public void create(MemberVODAO vo) throws Exception;
	
	public MemberVODAO read(String id) throws Exception;
	
	public void update(MemberVODAO vo) throws Exception;
	
	public void delete(String id) throws Exception;
	
	public List<MemberVODAO> listAll() throws Exception;
	

}
