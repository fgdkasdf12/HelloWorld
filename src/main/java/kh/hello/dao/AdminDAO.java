package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.InquiryDTO;
import kh.hello.dto.InquiryReplyDTO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	public int validLogin(String adminId, String password) {
		Map<String, String> param = new HashMap<>();
		param.put("adminId", adminId);
		param.put("password", password);
		return jdbc.selectOne("Admin.validLogin", param);
	}
	
	public int modifyInfo(String adminId, String password, String email) {
		Map<String, String> param = new HashMap<>();
		param.put("adminId", adminId);
		param.put("password", password);
		param.put("email", email);
		return jdbc.update("Admin.modifyInfo", param);
	}
	
	public List<InquiryDTO> selectInquiryByPage(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Admin.selectInquiryByPage", param);		
	}
	
	public int getInquiryTotal() {
		return jdbc.selectOne("Admin.getInquiryTotal");
	}
	
	public InquiryDTO inquiryDetailView(int seq) {
		return jdbc.selectOne("Admin.inquiryDetailView", seq);
	}
	
	public List<InquiryReplyDTO> getInquiryReply(int boardSeq) {
		return jdbc.selectList("Admin.getInquiryReply", boardSeq);
	}
	
	public int writeInquiry(String reply, int boardSeq) {
		Map<String, Object> param = new HashMap<>();
		param.put("reply", reply);
		param.put("boardSeq", boardSeq);
		return jdbc.insert("Admin.writeInquiry", param);
	}
	
	public int updateInquiryState(int seq) {
		return jdbc.update("Admin.updateInquiryState", seq);
	}
	
	public int getLatestReplySeq() {
		return jdbc.selectOne("Admin.getLatestReplySeq");
	}
	
	public InquiryReplyDTO getLatestReply(int seq) {
		return jdbc.selectOne("Admin.getLatestReply", seq);
	}
	
	public int deleteInquiryReply(int seq) {
		return jdbc.delete("Admin.deleteInquiryReply", seq);
	}
	
}















