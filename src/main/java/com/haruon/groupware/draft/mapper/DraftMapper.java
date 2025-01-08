package com.haruon.groupware.draft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.draft.dto.ResponseDraft;

@Mapper
public interface DraftMapper {

	List<ResponseDraft> findDraftByEmp(int empNo);
}
