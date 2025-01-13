package com.haruon.groupware.draft.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.draft.dto.RequestUpdateBasicDraft;

@Mapper
public interface UpdateMapper {

	int updateBasicDraft(RequestUpdateBasicDraft basicDraft);
}
