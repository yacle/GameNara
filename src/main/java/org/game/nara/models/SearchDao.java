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

	public Map search(String word) throws Exception{
		System.out.println("word="+word);
		Map map = new HashMap();
		List s=template.selectList("search.sellsearch", word);
		List f=template.selectList("search.freeboardsearch", word);
		List b=template.selectList("search.buysearch", word);
		List a=template.selectList("search.aftersearch", word);
		map.put("sell", s);
		map.put("free", f);
		map.put("buy", b);
		map.put("after", a);
		return map;
	}

}
