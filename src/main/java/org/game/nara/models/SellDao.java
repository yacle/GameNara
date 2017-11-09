package org.game.nara.models;

import java.util.*;

import org.game.nara.MemberVO;
import org.game.nara.SellVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellDao {
@Autowired
SqlSessionTemplate temp;

	public int sellAdd(SellVO vo) throws Exception {
		return temp.insert("sell.add", vo);
	}
	public int subtractPoint(String id) throws Exception {
		return temp.update("sell.subtractPoint", id);
	}
	public SellVO sellOne(String no) throws Exception {
		temp.update("sell.countup", no);
		return temp.selectOne("sell.sellOne", no);
	}
	
	public int sellUpdate(SellVO vo) throws Exception {
		return temp.update("sell.sellUpdate", vo);
	}
	public int sellUpdate2(SellVO vo) throws Exception {
		return temp.update("sell.sellUpdate2", vo);
	}
	
	public int stateUpdate(Map map) throws Exception {
		return temp.update("sell.state", map);
	}
	
	public List<Map> sellList()throws Exception  {
		return temp.selectList("sell.sellList");
	}
	public List<Map> sellConsole() throws Exception {
		return temp.selectList("sell.console");
	}
	public List<Map> sellTitle() throws Exception {
		return temp.selectList("sell.title");
	}
	public List<Map> sellAcce() throws Exception {
		return temp.selectList("sell.acce");
	}
	public List<Map> sellOther() throws Exception {
		return temp.selectList("sell.other");
	}
	
	public int deleteOne(String no) throws Exception {
		return temp.delete("sell.delete", no);
	}
	
}
