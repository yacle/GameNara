package org.game.nara.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IndexDao {
@Autowired
SqlSessionTemplate temp;

	public Map indexHandel() {
		Map map = new HashMap();
		List sell = temp.selectList("index.sell");
		int sellCnt = sell.size();
		List buy = temp.selectList("index.buy");
		int buyCnt = buy.size();
		List free = temp.selectList("index.free");
		int freeCnt = free.size();
			map.put("sell", sell);
			map.put("buy", buy);
			map.put("free", free);
			map.put("sellCnt", sellCnt);
			map.put("buyCnt", buyCnt);
			map.put("freeCnt", freeCnt);
		return map;
	}
}
