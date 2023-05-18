package com.market.carrot.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.market.carrot.dto.UserDTO;
import com.market.carrot.member.delete.DeleteService;
import com.market.carrot.member.mypage.MyPageUpdateService;
import com.market.carrot.member.signup.SignUpService;

/*	회원가입
	회원수정
	마이페이지
	회원탈퇴
*/
@Controller
public class MemberController {
	@RequestMapping("/member/signup1")
	public ModelAndView signUpPage1() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/SignUpForm1");

		return mav;
	}

	@RequestMapping("/member/signup2")
	public ModelAndView signUpPage2() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/SignUpForm2");

		return mav;
	}

	@RequestMapping("/member/signup3")
	public ModelAndView signUpPage3() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/SignUpForm3");

		return mav;
	}

	@RequestMapping(value = "/member/singup3_idcheck", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String ajaxtest(String id) {
		String msg = "";
		if (service.checkid(id) == 0) {
			msg = "사용가능한 아이디입니다.";
		} else {
			msg = "다른 아이디를 사용해주세요";
		}
		return msg;
	}

	@Autowired
	SignUpService service;

	@RequestMapping("/member/signup4")
	public String signup(UserDTO user) {
		service.signUp(user);
		return "member/SignUpForm4";
	}

	@RequestMapping("/member/mypage")
	public ModelAndView mypage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/mypage");
		return mav;
	}

	@Autowired
	DeleteService DS;

	@RequestMapping("/member/delete")
	public String delete(String id) {
		DS.delete(id);
		return "redirect:/logout";
	}

	@Autowired
	MyPageUpdateService US;

	@RequestMapping("/member/update.nick")
	public String update(String id, String nick, HttpSession session) {
		UserDTO dto = (UserDTO) session.getAttribute("userdata");
		id = dto.getUser_id();
		int result = US.nicknameUpdate(id, nick);
		System.out.println(id + "" + nick);
		
		if (result > 0) {
			dto.setNickname(nick);
			session.setAttribute("userdata", dto);
		}

		return "redirect:/member/mypage";
	}

}
