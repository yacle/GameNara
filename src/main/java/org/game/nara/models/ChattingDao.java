package org.game.nara.models;

import java.util.List;
import java.util.Map;

import org.game.nara.ChatVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ChattingDao {
	@Autowired
	SqlSessionTemplate temp;
	
	public int addChatting(ChatVO vo) {
		return temp.insert("chatting.add", vo);
	}
	public List<ChatVO> selectChat(String id) {
		return temp.selectList("chatting.chatList", id);
	}
	public ChatVO selectOne(String no) {
		return temp.selectOne("chatting.selectChat", no);
	}
	public int deleteChat(Map map) {
		List<String> list = (List) map.get("list");
		int r=0;
		for(String no : list) {
			r+=temp.delete("chatting.deleteChat", no);
		}
		return r;
	}
}
