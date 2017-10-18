package org.game.nara.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDao {
@Autowired
SqlSessionTemplate temp;

	public int noteAddHandle(Map map) {
		return temp.insert("chat.add", map);
	}
// ������ �� �޼��� ����Ʈ
	public List receiveNoteListHandle(String id) {
		return temp.selectList("chat.receiv_list", id);
	}
// ���� ���� �޼��� ����
	public Map receiveReadNote(String id) {
		return temp.selectOne("chat.receiv_read", id);
	}
// ���� ���� �޼��� ����Ʈ
	public List sendNoteListHandle(String id) {
		return temp.selectList("chat.send_list", id);
	}
// ���� ���� �޼��� ����
	public Map sendReadNote(String id) {
		return temp.selectOne("chat.send_read", id);
	}
	
	public int receiv_cntHandle(String id) {
		return temp.selectOne("chat.receiv_cnt", id);
	}
	
	public int receiveNoteDelHandle(Map map) {
		return temp.update("chat.receive_del", map);
	}
}
