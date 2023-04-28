package com.example.service;

import java.util.List;

import com.example.domain.BuyVO;

public interface BuyService {

	void register(BuyVO buy);

	List<BuyVO> getList();

	BuyVO get(String id);

	boolean modify(BuyVO buy);

	boolean remove(String id);

}
