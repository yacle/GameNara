package org.game.nara.models;

import java.util.*;

import org.game.nara.ReplyVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDao {
@Autowired
SqlSessionTemplate temp;

	public List<ReplyVO> list(Integer bno) throws Exception {
		return temp.selectList("reply.list", bno);
	}
	
	public int create(ReplyVO vo) throws Exception {
		return temp.insert("reply.create", vo);
	}
	
	public int update(ReplyVO vo) throws Exception {
		return temp.update("reply.update", vo);
	}
	
	public int delete(Integer rno) throws Exception {
		return temp.update("reply.delete", rno);
	}
	
	public int count(Integer bno) throws Exception {
		return temp.selectOne("reply.count", bno);
	}
	
	public int totalcnt(Integer bno) throws Exception {
		return temp.selectOne("replyPage.getReplyCount", bno);
	}
}
