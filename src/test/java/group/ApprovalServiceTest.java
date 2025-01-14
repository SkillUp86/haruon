package group;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.web.multipart.MultipartFile;

import com.haruon.groupware.approval.dto.RequestApproval;
import com.haruon.groupware.approval.dto.ResponseEmployee;
import com.haruon.groupware.approval.dto.ResponseFranchise;
import com.haruon.groupware.approval.entity.DraftFileEntity;
import com.haruon.groupware.approval.mapper.ApprovalMapper;
import com.haruon.groupware.approval.service.ApprovalService;
import com.haruon.groupware.common.entity.CommonCode;
import com.haruon.groupware.common.mapper.CommonMapper;

class ApprovalServiceTest {

    @Mock
    private ApprovalMapper approvalMapper;

    @Mock
    private CommonMapper commonMapper;

    @InjectMocks
    private ApprovalService approvalService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testAddApproval() {
        RequestApproval approval = new RequestApproval();
        approval.setKind("C02");
        approval.setDraNo(1);
        approval.setFormFile(Collections.emptyList());

        String path = "/test/path/";

        when(approvalMapper.saveBasicDraftByUser(approval)).thenReturn(1);
        when(approvalMapper.saveBusinessTripByUser(approval)).thenReturn(1);
        when(approvalMapper.saveApprovalByUser(approval)).thenReturn(1);

        // Act
        approvalService.addApproval(approval, path);

        // Assert
        verify(approvalMapper, times(1)).saveBasicDraftByUser(approval);
        verify(approvalMapper, times(1)).saveBusinessTripByUser(approval);
        verify(approvalMapper, times(1)).saveApprovalByUser(approval);
    }

    @Test
    void testExistApprovalFile() throws IOException {
        RequestApproval approval = new RequestApproval();
        approval.setDraNo(1);
        approval.setKind("C02");

        MultipartFile file = mock(MultipartFile.class);
        when(file.getOriginalFilename()).thenReturn("test.png");
        when(file.getContentType()).thenReturn("text/png");
        when(file.getSize()).thenReturn(123L);
        when(file.isEmpty()).thenReturn(false);

        doNothing().when(file).transferTo(any(File.class));

        approval.setFormFile(Arrays.asList(file));


        String path = "/test/path/";

        when(approvalMapper.saveBasicDraftByUser(any(RequestApproval.class))).thenReturn(1);
        when(approvalMapper.saveDraftFileByUser(any(DraftFileEntity.class))).thenReturn(1);

        approvalService.addApproval(approval, path);

        verify(file, times(1)).transferTo(any(File.class));
        verify(approvalMapper, times(1)).saveDraftFileByUser(any(DraftFileEntity.class));
    }

    @Test
    void testFindByParentCode() {
        String parentCode = "C00";
        List<CommonCode> mockCodes = Arrays.asList(new CommonCode(), new CommonCode());
        when(commonMapper.findByParentCode(parentCode)).thenReturn(mockCodes);

        List<CommonCode> result = approvalService.findByParentCode(parentCode);

        assertThat(result).isEqualTo(mockCodes);
        verify(commonMapper, times(1)).findByParentCode(parentCode);
    }

    @Test
    void testFindEmpByDept() {
        int deptNo = 1;
        int empNo = 2;
        List<?> mockEmployees = Arrays.asList(new Object(), new Object());
        when(approvalMapper.findEmpByDept(deptNo, empNo)).thenReturn((List<ResponseEmployee>) mockEmployees);

        List<?> result = approvalService.findEmpByDept(deptNo, empNo);

        assertThat(result).isEqualTo(mockEmployees);
        verify(approvalMapper, times(1)).findEmpByDept(deptNo, empNo);
    }

    @Test
    void testFindByFranchise() {
        List<?> mockFranchiseList = Arrays.asList(new Object(), new Object());
        when(approvalMapper.findByFranchise()).thenReturn((List<ResponseFranchise>) mockFranchiseList);

        List<?> result = approvalService.findByFranchise();

        assertThat(result).isEqualTo(mockFranchiseList);
        verify(approvalMapper, times(1)).findByFranchise();
    }
}
