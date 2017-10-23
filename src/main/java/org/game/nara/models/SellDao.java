package org.game.nara.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellDao {
@Autowired
SqlSessionTemplate temp;

	public void sellAdd(Map map) {
		temp.insert("sell.add", map);
	}
}
