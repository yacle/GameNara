package org.game.nara.models;

import java.util.*;

import org.game.nara.SellVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellDao {
@Autowired
SqlSessionTemplate temp;

	public int sellAdd(SellVO vo) {
		return temp.insert("sell.add", vo);
	}
	public int subtractPoint(String id) {
		return temp.update("sell.subtractPoint", id);
	}
	public SellVO sellOne(String no) {
		temp.update("sell.countup", no);
		return temp.selectOne("sell.sellOne", no);
	}
	
	public int sellUpdate(SellVO vo) {
		return temp.update("sell.sellUpdate", vo);
	}
	public int sellUpdate2(SellVO vo) {
		return temp.update("sell.sellUpdate2", vo);
	}
	
	public int stateUpdate(Map map) {
		return temp.update("sell.state", map);
	}
	
	public List<Map> sellList() {
		return temp.selectList("sell.sellList");
	}
	public List<Map> sellConsole() {
		return temp.selectList("sell.console");
	}
	public List<Map> sellTitle() {
		return temp.selectList("sell.title");
	}
	public List<Map> sellAcce() {
		return temp.selectList("sell.acce");
	}
	public List<Map> sellOther() {
		return temp.selectList("sell.other");
	}
	
	public int deleteOne(String no) {
		return temp.delete("sell.delete", no);
	}

}
