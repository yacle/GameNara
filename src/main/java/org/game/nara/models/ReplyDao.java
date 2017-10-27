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

	public List<ReplyVO> list(Integer bno){
		return temp.selectList("reply.list", bno);
	}
	
	public int create(ReplyVO vo){
		return temp.insert("reply.creat", vo);
	}
	
	public int update(ReplyVO vo){
		return temp.update("reply.update", vo);
	}
	
	public int delete(Integer rno){
		return temp.update("reply.deletet", rno);
	}

}