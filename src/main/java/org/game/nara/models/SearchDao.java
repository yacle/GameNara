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

public Map buysearch(String search) throws Exception{
	Map map= new HashMap();
<<<<<<< HEAD
	List<Map> s=template.selectList("search.sellsearch", search);
	List<Map> f=template.selectList("search.freeboardsearch", search);
	List<Map> b=template.selectList("search.buysearch", search);
	List<Map> a=template.selectList("search.aftersearch", search);
=======
	List<Map> s=template.selectList("search.sellsearch", sear);
	List<Map> f=template.selectList("search.freeboardsearch", sear);
	List<Map> b=template.selectList("search.buysearch",sear);
	List<Map> a=template.selectList("search.aftersearch", sear);
>>>>>>> branch 'master' of https://github.com/yacle/GameNara.git
	map.put("sell", s);
	map.put("free", f);
	map.put("buy", b);
	map.put("after", a);
	return map;
	
}

}
