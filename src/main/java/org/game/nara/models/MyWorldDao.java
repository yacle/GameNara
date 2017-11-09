package org.game.nara.models;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.game.nara.SellVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyWorldDao {
@Autowired
SqlSessionTemplate template;

public Map mysearch(String id) throws Exception{
	Map map= new HashMap();
	List<Map> s=template.selectList("myworld.sell", id);
	List<Map> f=template.selectList("myworld.free", id);
	List<Map> b=template.selectList("myworld.buy",id);
	List<Map> a=template.selectList("myworld.after", id);
	List<Map> fd=template.selectList("myworld.freedis", id);
	List<Map> mb=template.selectList("myworld.member", id);
	List<Map> pf=template.selectList("myworld.profile", id);
	map.put("sell", s);
	map.put("free", f);
	map.put("buy", b);
	map.put("after", a);
	map.put("freedis", fd);
	map.put("member",mb);
	map.put("profile",pf);
	return map;
}

public Map buyread(String num) throws Exception {
	template.update("buy.countup",num);
	return template.selectOne("myworld.buyread", num);
	}

public Map sellread(String num) throws Exception {
	template.update("sell.countup", num);
	return template.selectOne("myworld.sellread", num);
}
public Map afterread(String no) throws Exception {
	int r = template.update("after.cnt", no);
	return template.selectOne("myworld.afterread", no);
}
public Map freeread(String num) throws Exception {
	int r = template.update("freeB.countOne", num);
	return  template.selectOne("myworld.freeread", num);
}

public Map freedisread(String num) throws Exception {
	template.update("freeD.countOne",num);
	return template.selectOne("myworld.freedisread", num);
}

public List memberList() throws Exception {
return template.selectList("master.memberList");
}

public Map memberOne(String id) throws Exception {
	return template.selectOne("master.memberOne", id);
}


}
