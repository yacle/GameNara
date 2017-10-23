package org.game.nara.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MasterDao {
@Autowired
SqlSessionTemplate temp;

	public List memberHandle() {
	return temp.selectList("master.memberList");
	}
}
