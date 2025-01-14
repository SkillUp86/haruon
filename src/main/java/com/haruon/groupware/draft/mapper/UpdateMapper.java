package com.haruon.groupware.draft.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.haruon.groupware.draft.dto.request.RequestUpdateBasicDraft;
import com.haruon.groupware.draft.dto.request.RequestUpdateBusinessDraft;
import com.haruon.groupware.draft.dto.request.RequestUpdateSalesDraft;
import com.haruon.groupware.draft.dto.request.RequestUpdateVacationDraft;

@Mapper
public interface UpdateMapper {
	// 휴가 문서 업데이트
	int	updateVacationDraft(RequestUpdateVacationDraft vacationDraft);
	// 출장 문서 업데이트
	int updateSalesDraft(RequestUpdateSalesDraft salesDraft);
	// 출장 문서 업데이트
	int updateBusinessDraft(RequestUpdateBusinessDraft businessDraft);
	// 기본 문서 업데이트
	int updateBasicDraft(RequestUpdateBasicDraft basicDraft);
}
