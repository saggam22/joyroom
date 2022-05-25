package co.dev.web.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;

import co.dev.web.Controller;

public class MailSendControl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String userId = request.getParameter("id");
		
		// 메일 내용
		String key = MailSendControl.createKey();
		String subject = "[ 카페인디 ] 비밀번호 찾기를 위한 인증코드";
		String msg = "";
		msg += "<div align='center' style='border:1px solid black;'>";
		msg += "<h3> 비밀번호 찾기 인증코드 입니다. </h3>";
		msg += "비밀번호 찾기 페이지로 돌아가 인증코드 <strong>";
		msg += key + "</strong>을(를) 입력해 주세요.</div><br>";
		
		sendMail(userId, subject, msg);
		
		HttpSession session = request.getSession();
		session.setAttribute("key", key);
		
		request.getRequestDispatcher("/view/user/findPwdKey.tiles").forward(request, response);
		return;

	}
	
	// 인증번호 보내는 이메일
		public static void sendMail(String toEmail, String subject, String msg) {
			
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";		// SMTP 서버명
			String hostSMTPid = "wlqls12";			// 네이버 아이디
			String hostSMTPpwd = "tnqtnql!";		
			
			// 메일 보내는 사람 설정
			String fromEmail = "wlqls12@naver.com";
			String fromName = "caffeineD";
			
			// email 전송
			try {
				HtmlEmail mail = new HtmlEmail();
				mail.setDebug(true);
				mail.setCharset(charSet);
				mail.setSSLOnConnect(true);			// SSL 사용 (TSL이 없는 경우 SSL 사용)
				mail.setHostName(hostSMTP);
				mail.setSmtpPort(587);				// SMTP Port
				
				mail.setAuthentication(hostSMTPid, hostSMTPpwd);
				mail.setStartTLSEnabled(true);		// TSL 사용
				mail.addTo(toEmail);
				mail.setFrom(fromEmail, fromName, charSet);
				mail.setSubject(subject);
				mail.setHtmlMsg(msg);
				mail.send();
				
				System.out.println("메일 전송 완료");
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("메일 전송 실패");
			}
			
		}
		
		// 인증번호 생성
		public static String createKey() {
			char[] charSet = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N',
					'O','P','Q','R','S','T','U','V','W','X','Y','Z'};
			StringBuffer key = new StringBuffer();
			
			for (int i = 0; i < 10; i++) {
				int idx = (int) (charSet.length*Math.random());
				key.append(charSet[idx]);
			}
			
			return key.toString();
		}

}
