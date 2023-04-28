package com.example.mapper;

import java.util.List;

import com.example.domain.ApiVO;

/*import org.apache.ibatis.annotations.Select;*/

import com.example.domain.Criteria;

public interface BoardMapper
{
	/* @Select("select * from tbl_board where bno > 0") */

	public List<ApiVO> getList();

	public void insert(ApiVO api);
	public Integer insertSelectKey(ApiVO board);
	public ApiVO read(Long bno);
	public int delete(Long bno);
	public int update(ApiVO board);

	public List<ApiVO> getListWithPaging(Criteria cri);
 }
