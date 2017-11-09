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
	public int noteAddHandle(Map map) throws Exception  {
		return temp.insert("chat.add", map);
	}
// ������ �� �޼��� ����Ʈ
	public List receiveNoteListHandle(String id) throws Exception  {
		return temp.selectList("chat.receiv_list", id);
	}
// ���� ���� �޼��� ����Ʈ
	public List sendNoteListHandle(String id) throws Exception  {
		return temp.selectList("chat.send_list", id);
	}
// ���� �޼��� ī��Ʈ	
	public int receiv_cntHandle(String id) throws Exception  {
		return temp.selectOne("chat.receiv_cnt", id);
	}
// ���� ���� �޼��� ���� ����	
	public int receiveNoteDelHandle(Map map) throws Exception  {
		return temp.update("chat.receive_del", map);
	}
// ���� ���� �޼��� ���� ����	
	public int sendNoteDelHandle(Map map) throws Exception  {
		return temp.update("chat.send_del", map);
	}
	
	public int readPoint(String id) throws Exception {
		return temp.selectOne("chat.receiv_pnt", id);
	}
	
	public List memberAll() throws Exception {
		return temp.selectList("chat.memberAll");
	}
}
