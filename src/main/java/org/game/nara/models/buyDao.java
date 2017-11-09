package org.game.nara.models;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.game.nara.BuyVO;
import org.game.nara.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class buyDao {
	@Autowired
	SqlSessionTemplate template;

	public List<BuyVO> readAll() throws Exception {
		return template.selectList("buy.list");
	}

	public List<BuyVO> consoleread() throws Exception {
		return template.selectList("buy.consoleread");
	}

	public List<BuyVO> titleread() throws Exception {

		return template.selectList("buy.titleread");
	}

	public List<BuyVO> accessoryread() throws Exception {

		return template.selectList("buy.accessoryread");
	}
	
	public List<BuyVO> othersread() throws Exception {

		return template.selectList("buy.othersread");
	}

	
	public int endset (BuyVO vo) throws Exception {
		return template.update("buy.endset", vo);
	}
	
	public int adjust (BuyVO vo) throws Exception {
		return template.update("buy.adjust",vo);
	}
	
	public int addOne(BuyVO vo) throws Exception {
		return template.insert("buy.add", vo);
	}

	public Map readOne(String num) throws Exception {
		template.update("buy.countup",num);
		return template.selectOne("buy.readOne", num);
		}

	public int delete(BuyVO vo) throws Exception {
		return template.delete("buy.delete",vo);
	}
	
	public MemberVO checkpoint(MemberVO vo) throws Exception {
		return template.selectOne("buy.checkpoint",vo);
	}
	
	public MemberVO readInfo(MemberVO id) throws Exception {
		return template.selectOne("member.readInfo", id);
	}
	
}
