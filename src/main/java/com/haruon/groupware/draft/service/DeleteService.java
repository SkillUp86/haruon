package com.haruon.groupware.draft.service;

import java.io.File;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haruon.groupware.approval.entity.DraftFileEntity;
import com.haruon.groupware.draft.mapper.DeleteMapper;
import com.haruon.groupware.draft.mapper.DraftMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class DeleteService {

    private final DeleteMapper deleteMapper;
    private final DraftMapper draftMapper;

    public DeleteService(DeleteMapper deleteMapper, DraftMapper draftMapper) {
        this.deleteMapper = deleteMapper;
        this.draftMapper = draftMapper;
    }

    public int getDeleteFile(int drafNo, String path) {
        DraftFileEntity file = deleteMapper.findDraftFileByDrafNo(drafNo);
        log.debug(file.toString());
        String filename = path + file.getFileName() + "." + file.getExt();
        File f = new File(filename);
        f.delete();
        int row = deleteMapper.removeDraftFile(drafNo);
        return row;
    }

    // 기안서 삭제
    public void getDeleteDraft(String docType, int draNo, int appNo, String path) {
        removeApprovalAndRefer(draNo, appNo, path);
        switch (docType) {
            case "출장": // 출장문서 삭제
                deleteMapper.removeBusinessDraftByDraNo(draNo);
                break;
            case "매출":// 매출 보고서 삭제
                deleteMapper.removeSalesDraftByDraNo(draNo);
                break;
            case "휴가":// 휴가 보고서 삭제
                deleteMapper.removeVacationDraftByDraNo(draNo);
                break;
            case "기본":
                break;
            default:
                throw new IllegalArgumentException("없는 유형입니다.");
        }
        deleteMapper.removeBasicDraftByDraNo(draNo); // 기본 문서 삭제
//		if (docType.equals("출장")) {
//			deleteMapper.removeBusinessDraftByDraNo(draNo);
//		} else if (docType.equals("매출")) {
//			deleteMapper.removeSalesDraftByDraNo(draNo);
//		} else if (docType.equals("휴가")) {
//			deleteMapper.removeVacationDraftByDraNo(draNo);
//		}
//		deleteMapper.removeBasicDraftByDraNo(draNo); 

    }

    // 반복되는 메서드 하나로 묶기
    private void removeApprovalAndRefer(int draNo, int appNo, String path) {
        // 삭제 순서 1.참조자 삭제 2.결재 삭제 3.파일전체 삭제 4.물리적 파일 삭제
        deleteMapper.removeReferencesByAppNo(appNo);
        deleteMapper.removeApprovalByAppNo(appNo);
        List<DraftFileEntity> fileList = draftMapper.findDraftByFile(draNo);
        if (fileList.size() > 0) {
            fileList.stream().map(f -> new File(path + f.getFileName() + "." + f.getExt()))
                    .forEach(file -> {
                        if (!file.delete()) {
                            log.debug("파일삭제 실패 ={}", file.getAbsolutePath());
                        }
                    });
            deleteMapper.removeDraftFileByDraNo(draNo);
        }
    }
}
