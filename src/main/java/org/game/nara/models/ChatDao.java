package org.game.nara.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDao {
@Autowired
SqlSessionTemplate temp;
// �޼��� ����
	public int noteAddHandle(Map map) {
		return temp.insert("chat.add", map);
	}
// ������ �� �޼��� ����Ʈ
	public List receiveNoteListHandle(String id) {
		return temp.selectList("chat.receiv_list", id);
	}
// ���� ���� �޼��� ����Ʈ
	public List sendNoteListHandle(String id) {
		return temp.selectList("chat.send_list", id);
	}
// ���� �޼��� ī��Ʈ	
	public int receiv_cntHandle(String id) {
		return temp.selectOne("chat.receiv_cnt", id);
	}
// ���� ���� �޼��� ���� ����	
	public int receiveNoteDelHandle(Map map) {
		return temp.update("chat.receive_del", map);
	}
// ���� ���� �޼��� ���� ����	
	public int sendNoteDelHandle(Map map) {
		return temp.update("chat.send_del", map);
	}
}
