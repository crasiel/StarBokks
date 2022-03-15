package com.spring.service;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.spring.member.MemberDAO;
import com.spring.member.MemberDTO;
@Service
public class MemberService {
	@Autowired private MemberDAO dao;

	public String getHash(String input) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		md.reset();
		md.update(input.getBytes("UTF-8"));
		String hashpw = String.format("%0128x", new BigInteger(1, md.digest()));
		return hashpw;
	}		// 패스워드 Hash 처리
	
	public int insertMember(MemberDTO dto) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		dto.setUser_pw(getHash(dto.getUser_pw()));		// 패스워드 Hash 처리
		return dao.insertMember(dto);
	}

	public MemberDTO loginMember(MemberDTO dto) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		dto.setUser_pw(getHash(dto.getUser_pw()));		// 패스워드 Hash 처리
		return dao.loginMember(dto);
	}

	public String findId(MemberDTO dto) {
		return dao.findId(dto);
	}

	public String reNewPw(MemberDTO dto) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		String newPw = UUID.randomUUID().toString().split("-")[0];
		String hashPw = getHash(newPw);		// 패스워드 Hash 처리
		dto.setUser_pw(hashPw);
		int row = dao.reNewPw(dto);
		return row == 1? newPw : null;
	}

	public boolean idCheck(String id) {
		int count = dao.idCheck(id);
		return count == 0;
	}

	public boolean emailCheck(String email) {
		int count = dao.emailCheck(email);
		return count == 0;
	}
	
	public boolean pwCheck(String oldpw, String id) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		MemberDTO dto = new MemberDTO();
		dto.setUser_pw(getHash(oldpw));
		dto.setUser_id(id);
		int count = dao.pwCheck(dto);
		return count == 1;
	}

	// 메일 발송 메서드
//	@Autowired JavaMailSender sender;			
	public boolean sendEmail(String useremail, String text, String success) {
//		System.out.println("메일 받는 사람 : " + useremail);
		
		// root-context.xml에 메일 설정 안한 경우 
		String host = "smtp.naver.com";
		final String username = "아이디";
		final String password = "비밀번호";
		int port = 465;	//SMTP 포트
		// 메일에 보내는 서버에 대한 인증과 속성을 설정한다.
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.trust", host);
		
		Session	mailSession = Session.getDefaultInstance(props, new Authenticator() {		
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});			
		mailSession.setDebug(true);
		// 메일의 전반적인 내용을 설정 (보내는 사람, 받는사람, 제목, 내용)
		Message mimeMessage = new MimeMessage(mailSession);
				
		String body="고객님의 " + text + "는(은) " + success + " 입니다.";
				
		try {
			mimeMessage.setFrom(new InternetAddress("보내는 사람 메일 주소"));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(useremail));
			mimeMessage.setSubject("[STARBOOKS] 요청하신 " + text + " 찾기 메일 발송합니다.");
			mimeMessage.setText(body);
			Transport.send(mimeMessage);
		} catch (MessagingException e) {		
			return false;
		}		
		return true;
		
		
		
		//root-context.xml 메일 설정한 경우 
//		String body="고객님의 " + text + "는(은) " + success + " 입니다.";
//		try {
//			MimeMessage mime = sender.createMimeMessage();
//			MimeMessageHelper helper = new MimeMessageHelper(mime, true, "UTF-8");
//					
//			helper.setFrom("보내는 사람 메일 주소");		// 보내는 사람
//			helper.setTo(useremail);							// 받는 사람			
//			helper.setSubject("[STARBOOKS] 요청하신 " + text + " 찾기 메일 발송합니다.");			// 메일 제목
//			helper.setText(body); 						// 메일 내용
//			sender.send(mime);
//			return true;
//		} catch (MessagingException e) {
//			System.out.println("메일 오류" + e.getMessage());
//			return false;
//		}
		
	}

	public int changePW(MemberDTO dto) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		dto.setUser_pw(getHash(dto.getUser_pw()));
		return dao.changePw(dto);
	}

	public boolean insertDeleteMem(String id) {
		return dao.insertDeleteMem(id);
	}

	public int delete(String id) {
		return dao.delete(id);
	}

	public int chkUpdate(MemberDTO dto,String id, Integer eventChk, Integer otherChk) {

		dto.setUser_id(id);
		dto.setEventChk((eventChk != null ? 1 : 0 ));
		dto.setOtherChk((otherChk != null ? 1 : 0 ));

		return dao.chkUpdate(dto);
	}

}
