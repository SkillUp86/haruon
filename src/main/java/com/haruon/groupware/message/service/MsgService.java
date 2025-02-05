package com.haruon.groupware.message.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.message.dto.MsgDto;
import com.haruon.groupware.message.dto.MsgReaderDto;
import com.haruon.groupware.message.dto.MsgReaderListDto;
import com.haruon.groupware.message.dto.MsgSenderDto;
import com.haruon.groupware.message.entity.MsgFile;
import com.haruon.groupware.message.mapper.MsgMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class MsgService {
	@Autowired MsgMapper msgMapper;
	
	// 임시저장 발송
	public void modifyMsg (MsgDto msgDto, String path, Integer msgNo) {
		// 키값 msgNo
		log.debug("msgNo =========>" + msgNo);
		log.debug("msgDto.getMsgNo() =========>" + msgDto.getMsgNo());
		
		if (msgDto.getMsgFiles() != null && !msgDto.getMsgFiles().isEmpty()) {
		log.debug("msgDto.getMsgFiles() =========>" + msgDto.getMsgFiles());
		log.debug("msgDto.getMsgFiles size() =========>" + msgDto.getMsgFiles().size());
		log.debug("msgDto.getMsgFiles getSize() =========>" + msgDto.getMsgFiles().get(0).getSize());
		
			if(msgDto.getMsgFiles().get(0).getSize() > 0) {
				// 파일 입력
				List<MultipartFile> file = msgDto.getMsgFiles();
				for (MultipartFile f : file) {
					MsgFile msgFile = new MsgFile();
					msgFile.setMsgNo(msgNo);
					msgFile.setKind(f.getContentType());
					msgFile.setSize(f.getSize());
					String filename = UUID.randomUUID().toString().replace("-", "");
					msgFile.setFileName(filename);
					int dotIdx = f.getOriginalFilename().lastIndexOf("."); // (해당하는 점을 찾아내서
					String originname = f.getOriginalFilename().substring(0, dotIdx);
					String ext = f.getOriginalFilename().substring(dotIdx + 1);
					msgFile.setOriginName(originname);
					msgFile.setExt(ext);
					
					int msgFileRow = msgMapper.insertMsgFile(msgFile);
					if (msgFileRow == 1) {
						// 물리적 파일 저장
						try {
							f.transferTo(new File(path + filename + "." + ext));
						} catch (Exception e) {
							e.printStackTrace();
							// 예외 발생하고 예외처리 하지 않아야지 @Transactional 작동한다
							// so... RuntimeException을 인위적으로 발생
							// -> try에서 작동하는 예외 말고 다른 예외를 인위적으로 발생시켜서 알림
							throw new RuntimeException();
						} 
					}
				}
			}
		} else {
	        log.debug("No files to process.");
	    }
		log.debug("msgDto ================> " + msgDto);
		
		msgMapper.modifyMsg(msgDto);
		msgMapper.modifyReaderMsg(msgDto);
		msgMapper.modifySenderMsg(msgDto);
	}
	
	// 임시저장 삭제
	public void deleteMsg(Integer msgNo) {
		msgMapper.deleteMsgR(msgNo); // 받은메세지 삭제
		msgMapper.deleteMsgS(msgNo); // 보낸메세지 삭제
//		msgMapper.deleteMsgFile(); // 파일 삭제
//		msgMapper.deleteMsg(); // 메세지 삭제
	}


	// 쪽지 발송
	public void insertMsg (MsgDto msgDto, String path) {
		// 교육 등록
		Integer msg = msgMapper.insertMsg(msgDto);
		
		// 키값
		Integer msgNo = msgDto.getMsgNo();
		
		log.debug("msgDto.getMsgFiles() =========>" + msgDto.getMsgFiles());
		log.debug("msgDto.getMsgFiles size() =========>" + msgDto.getMsgFiles().size());
		log.debug("msgDto.getMsgFiles getSize() =========>" + msgDto.getMsgFiles().get(0).getSize());
		
		if(msg == 1 && msgDto.getMsgFiles().get(0).getSize() > 0) {
			// 파일 입력
			List<MultipartFile> file = msgDto.getMsgFiles();
			for (MultipartFile f : file) {
				MsgFile msgFile = new MsgFile();
				msgFile.setMsgNo(msgNo);
				msgFile.setKind(f.getContentType());
				msgFile.setSize(f.getSize());
				String filename = UUID.randomUUID().toString().replace("-", "");
				msgFile.setFileName(filename);
				int dotIdx = f.getOriginalFilename().lastIndexOf("."); // (해당하는 점을 찾아내서
				String originname = f.getOriginalFilename().substring(0, dotIdx);
				String ext = f.getOriginalFilename().substring(dotIdx + 1);
				msgFile.setOriginName(originname);
				msgFile.setExt(ext);
				
				int msgFileRow = msgMapper.insertMsgFile(msgFile);
				if (msgFileRow == 1) {
					// 물리적 파일 저장
					try {
						f.transferTo(new File(path + filename + "." + ext));
					} catch (Exception e) {
						e.printStackTrace();
						// 예외 발생하고 예외처리 하지 않아야지 @Transactional 작동한다
						// so... RuntimeException을 인위적으로 발생
						// -> try에서 작동하는 예외 말고 다른 예외를 인위적으로 발생시켜서 알림
						throw new RuntimeException();
					} 
				}
			}
		}
		log.debug("msgDto ================> " + msgDto);
		
		msgMapper.insertReaderMsg(msgDto);
		msgMapper.insertSenderMsg(msgDto);
	}
	
	// 쪽지 파일
	public List<MsgFile> getMsgFileList(Integer msgNo) {
		return msgMapper.getMsgFileList(msgNo);
	}
	
	// 받은 쪽지함
	public List<MsgReaderDto> getReadersMsg(Integer empNo) {
		return msgMapper.getReadersMsg(empNo);
	}
	// 쪽지 읽음
	public Integer modifyReadState(Integer msgNo) {
		return msgMapper.modifyReadState(msgNo);
	}
	
	// 휴지통 이동
	public Integer insertTrashMsg(Integer msgNo) {
		return msgMapper.insertTrashMsg(msgNo);
	}
	// 휴지통 -> 받은쪽지 복원
	public Integer backMsg(Integer msgNo) {
		return msgMapper.backMsg(msgNo);
	}	
	// 휴지통 비우기
	public Boolean deleteEmptyTrash(Integer empNo) {
		Integer row = msgMapper.deleteEmptyTrash(empNo);
		return row > 0; // 삭제된 행이 1개 이상이면 성공, 아니면 실패
	}
	// 영구 삭제
	public Integer deleteMsgR(Integer msgNo) {
		return msgMapper.deleteMsgR(msgNo);
	}
	public Integer deleteMsgS(Integer msgNo) {
		return msgMapper.deleteMsgS(msgNo);
	}

	// 보낸 쪽지함
	public List<MsgSenderDto> getSendersMsg(Integer empNo) {
		return msgMapper.getSendersMsg(empNo);
	}
	
	// 임시 보관함
	public List<MsgSenderDto> getTemporaryMsgList(Integer empNo) {
		return msgMapper.getTemporaryMsgList(empNo);
	}	
	
	// 휴지통(받은쪽지)
	public List<MsgReaderDto> getTrashsMsg(Integer empNo) {
		return msgMapper.getTrashsMsg(empNo);
	}
	

	// Header에 표시할 읽지 않은 상태인 수신쪽지관련 정보요약
	public List<MsgReaderListDto> findUnreadMsgSum(Integer empNo) {
		return msgMapper.findUnreadMsgSum(empNo);
	}
	// Header에 표시할 읽지 않은 상태인 수신쪽지의 수
	public Integer findUnreadMsgCnt(Integer empNo) {
		return msgMapper.findUnreadMsgCnt(empNo);
	}
	
}
