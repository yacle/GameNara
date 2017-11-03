package org.game.nara.models;

import java.util.List;
import java.util.Map;

import org.game.nara.BuyVO;
import org.game.nara.FreeBoardVO;
import org.game.nara.FreeDistributeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeDistributeDao {

	@Autowired
	SqlSessionTemplate tmp;
	
	public List<FreeDistributeVO> listAll() {
		return tmp.selectList("freeD.listAll");
	}
	
	public int addOne(FreeDistributeVO vo) {
		return tmp.insert("freeD.addOne", vo);
	}
	
	public Map readOne(String num) {
		tmp.update("freeD.countOne",num);
		return tmp.selectOne("freeD.readOne", num);
	}
	
	public int endSet (FreeDistributeVO vo) {
		return tmp.update("freeD.endSet",vo);
	}
	
	public int modifyFreeD(FreeDistributeVO vo) {
		return tmp.update("freeD.modifyFreeD",vo);
	}
	
	public int delete(FreeDistributeVO vo) {
		return tmp.delete("freeD.delete",vo);
	}
}
