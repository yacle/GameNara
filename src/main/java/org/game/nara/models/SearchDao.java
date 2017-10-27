package org.game.nara.models;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDao {
@Autowired
SqlSessionTemplate template;

public Map buysearch(String search) {
	Map map= new HashMap();
	System.out.println("search :"+search.toString());
	List<Map> s=template.selectList("search.sellsearch", search);
	System.out.println(s.toString());
	List<Map> f=template.selectList("search.freeboardsearch", search);
	List<Map> b=template.selectList("search.buysearch",search);
	System.out.println(b.toString());
	List<Map> a=template.selectList("search.aftersearch", search);
	map.put("sell", s);
	map.put("free", f);
	map.put("buy", b);
	map.put("after", a);
	return map;
	
}

}
