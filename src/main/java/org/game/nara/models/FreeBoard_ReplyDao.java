package org.game.nara.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoard_ReplyDao {

	@Autowired
	SqlSessionTemplate tmp;
	
	public int addReply(Map map) {
		return tmp.insert("reply.addReply", map);
	}
	
	public List<Map> readReply(String parent) {
		return tmp.selectList("reply.readReply",parent);
	}
	
	public int deleteReply(String num) {
		return tmp.delete("reply.deleteReply",num);
	}
	
	public int updateReply(Map map) {
		return tmp.update("reply.updateReply",map);
	}
}
