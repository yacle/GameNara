package org.game.nara.models;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.game.nara.BuyVO;
import org.game.nara.FreeBoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDao {

	@Autowired
	SqlSessionTemplate tmp;
	
	public List<FreeBoardVO> listAll() {
		return tmp.selectList("freeB.listAll");
	}
	
	public int addOne(FreeBoardVO vo) {
		return tmp.insert("freeB.addOne", vo);
	}

	public Map readOne(String num) {
		int r = tmp.update("freeB.countOne", num);
		return  tmp.selectOne("freeB.readOne", num);
	}
	
	public int addPoint(String id) {
		return tmp.update("freeB.addPoint",id);
	}
	
	public int subPoint(String id) {
		return tmp.update("freeB.subPoint",id);
	}
	
	public int modifyFreeB(FreeBoardVO vo) {
		return tmp.update("freeB.modifyFreeB",vo);
	}
	
	public int delete(FreeBoardVO vo) {
		return tmp.delete("freeB.delete",vo);
	}
}
