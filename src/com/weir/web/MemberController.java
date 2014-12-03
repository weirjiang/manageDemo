package com.weir.web;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weir.domain.Member;
import com.weir.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	@Inject
	private MemberService memberService;
	@RequestMapping(value="/memberLogin.do",method = RequestMethod.POST)
	public String memberLogin(HttpServletRequest req){
		String memberName = req.getParameter("memberName");
		String	pass = req.getParameter("password");
		Member member = memberService.findOneByNameAndPass(memberName, pass);
		if(member.getId()!=null){
			return "admin/admin_index";
		}
		return "sys/userLogin";
	}
	@RequestMapping(value="/login",method = RequestMethod.GET)
	public String login(HttpServletRequest req){
		return "admin.login";
	}
	@RequestMapping(value="/doLogin",method = RequestMethod.POST)
	@ResponseBody
    public Map<String, Object> doLogin(HttpServletRequest request){
		Map<String, Object> model = new HashMap<String, Object>();
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		Member member = memberService.findOneByNameAndPass(userName, password);
		if(member==null){
			model.put("status", "error");
		}else{
			model.put("status", "ok");
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			model.put("member", member);
		}
		return model;
	}
	
	@RequestMapping(value = "/homemgr/i", method = RequestMethod.GET)
    public String i(Map<String, Object> viewData) {
        return "admin.homemgr.homemgr";
    }
}
