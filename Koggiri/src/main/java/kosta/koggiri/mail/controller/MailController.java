package kosta.koggiri.mail.controller;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/mail")
public class MailController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Inject
	private JavaMailSenderImpl sender;
	
	@RequestMapping(value="/login",method= RequestMethod.GET)
	public String mailLogin()throws Exception{
		return "/email/login";
	}
	
	@RequestMapping(value="/loginok",method= RequestMethod.POST)
	public String mailLoginok(mailVO mailVO,RedirectAttributes ratt)throws Exception{
		sender.setUsername(mailVO.getUsername());
		sender.setPassword(mailVO.getPassword());
		ratt.addFlashAttribute("from",mailVO.getUsername());
		
		return "redirect:/mail/send";
	}
	
	@RequestMapping(value = "/send", method = RequestMethod.GET)
	public String send(Model model)throws Exception{
		
		return "/email/send";
	}
	
	@RequestMapping(value = "/send", method = RequestMethod.POST)
	public void sendMail(String from, String to, String subject, String text, String formUrl)
			throws FileNotFoundException, URISyntaxException {
		try {
			SimpleMailMessage message = new SimpleMailMessage();
			System.out.println(from);
			message.setFrom(from);
			message.setTo(to);
			message.setSubject(subject);
			message.setText(text);

			//mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
