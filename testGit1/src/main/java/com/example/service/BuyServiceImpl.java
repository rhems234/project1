package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.BuyVO;
import com.example.mapper.BuyMapper;

@Service
public class BuyServiceImpl implements BuyService {

	@Autowired
	private BuyMapper mapper;

	@Override
	public void register(BuyVO buy) {
		mapper.insert(buy);
	}

	@Override
	public List<BuyVO> getList() {
		return mapper.getList();
	}

	@Override
	public BuyVO get(String id) {
		return mapper.read(id);
	}

	@Override
	public boolean modify(BuyVO buy) {
		return mapper.update(buy) == 1;
	}

	@Override
	public boolean remove(String id) {
		return mapper.delete(id) == 1;
	}
}
