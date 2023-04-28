package com.example.mapper;

import java.util.List;

import com.example.domain.BuyVO;

public interface BuyMapper {

	public void insert(BuyVO buy);

	public List<BuyVO> getList();

	public BuyVO read(String id);

	public int update(BuyVO buy);

	public int delete(String id);
}
