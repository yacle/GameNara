package org.game.nara.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDao {
@Autowired
SqlSessionTemplate temp;
// 메세지 저장
	public int noteAddHandle(Map map) {
		return temp.insert("chat.add", map);
	}
// 나한테 온 메세지 리스트
	public List receiveNoteListHandle(String id) {
		return temp.selectList("chat.receiv_list", id);
	}
// 내가 보낸 메세지 리스트
	public List sendNoteListHandle(String id) {
		return temp.selectList("chat.send_list", id);
	}
// 받은 메세지 카운트	
	public int receiv_cntHandle(String id) {
		return temp.selectOne("chat.receiv_cnt", id);
	}
// 내가 받은 메세지 선택 삭제	
	public int receiveNoteDelHandle(Map map) {
		return temp.update("chat.receive_del", map);
	}
// 내가 보낸 메세지 선택 삭제	
	public int sendNoteDelHandle(Map map) {
		return temp.update("chat.send_del", map);
	}
}
