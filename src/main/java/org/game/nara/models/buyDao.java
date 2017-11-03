package org.game.nara.models;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.game.nara.BuyVO;
import org.game.nara.controllers.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class buyDao {
	@Autowired
	SqlSessionTemplate template;


	public List<BuyVO> readAll() {
		return template.selectList("buy.list");
	}
	
	public List<BuyVO> consoleread() {
		return template.selectList("buy.consoleread");

	}
	public List<BuyVO> titleread() {
		return template.selectList("buy.titleread");

	}
	public List<BuyVO> accessoryread() {
		return template.selectList("buy.accessoryread");

	}
	
	public List<BuyVO> othersread() {
		return template.selectList("buy.othersread");
	}
	
	public int endset (BuyVO vo) {
		return template.update("buy.endset", vo);
	}
	
	public int adjust (BuyVO vo) {
		return template.update("buy.adjust",vo);
	}
	
	public boolean addOne(BuyVO vo) {
		template.insert("buy.add", vo);
		return true;
	}

	public Map readOne(String num) {
		template.update("buy.countup",num);
		return template.selectOne("buy.readOne", num);
		}

	public int delete(BuyVO vo) {
		return template.delete("buy.delete",vo);
	}
	
	public MemberVO checkpoint(MemberVO vo) {
		return template.selectOne("buy.checkpoint",vo);
	}
	
	public MemberVO readInfo(MemberVO id) {
		return template.selectOne("member.readInfo", id);
	}
	
}
