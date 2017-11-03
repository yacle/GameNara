package org.game.nara.models;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.game.nara.controllers.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class buyDao {
	@Autowired
	SqlSessionTemplate template;

//����Ʈ ��ü �ҷ�����
	public List<Map> readAll() {
		return template.selectList("buy.list");
	}
//�ܼ� ����Ʈ�� �ҷ�����
	public List<Map> consoleread() {
		return template.selectList("buy.consoleread");
	}
//Ÿ��Ʋ ����Ʈ�� �ҷ�����
	public List<Map> titleread() {
		return template.selectList("buy.titleread");
	}
//�ֺ���� ����Ʈ�� �ҷ�����
	public List<Map> accessoryread() {
		return template.selectList("buy.accessoryread");
	}
//��Ÿ ����Ʈ�� �ҷ�����
	public List<Map> othersread() {
		return template.selectList("buy.othersread");
	}
//�ŷ��Ϸ� ��ư
	public int endset (Map map) {
		return template.update("buy.endset",map);
	}
	
	public int adjust (Map map) {
		return template.update("buy.adjust",map);
	}
	
	public boolean addOne(Map map) {
		template.insert("buy.add", map);
		return true;
	}

	public Map readOne(String num) {
		template.update("buy.countup",num);
		return template.selectOne("buy.readOne", num);
		}

	public int delete(Map num) {
		return template.delete("buy.delete",num);
	}
	
	public MemberVO checkpoint(MemberVO vo) {
		return template.selectOne("buy.checkpoint",vo);
	}
	
	public MemberVO readInfo(MemberVO id) {
		return template.selectOne("member.readInfo", id);
	}
	
}
