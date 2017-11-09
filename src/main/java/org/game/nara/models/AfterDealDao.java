package org.game.nara.models;

import java.util.*;

import org.game.nara.AfterVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AfterDealDao {
@Autowired
SqlSessionTemplate temp;

	public int addAfter(AfterVO vo) throws Exception {
		return temp.insert("after.add", vo);
	}
	
	public AfterVO readAfter(String no) throws Exception {
		int r = temp.update("after.cnt", no);
		return temp.selectOne("after.detail", no);
	}
	
	public List listAfter() throws Exception {
		return temp.selectList("after.list");
	}
	
	public int addPoint(String id) throws Exception {
		return temp.insert("after.addPoint", id);
	}
	
	public int modifyAfter(Map map) throws Exception {
		return temp.update("after.modifyAfter", map);
	}
	
	public int deleteAfter(AfterVO vo) throws Exception {
		return temp.delete("after.delete", vo);
	}
}
