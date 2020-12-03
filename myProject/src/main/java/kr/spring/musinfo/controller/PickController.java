package kr.spring.musinfo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.spring.member.vo.MemberVO;
import kr.spring.musinfo.service.PickService;
import kr.spring.musinfo.vo.ContentsVO;
import kr.spring.musinfo.vo.PickVO;

@Controller
public class PickController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private PickService pickService;
	
	// 자바빈 초기화
	@ModelAttribute
	public PickVO initCommand(){
		return new PickVO();
	}

	
	
	// 찜하기 처리
	@RequestMapping(value="/musinfo/pick.do", method=RequestMethod.POST)
	public String submitPick(@Valid PickVO pickVO, BindingResult result, HttpServletRequest request, HttpSession session, Model model ) {
		if(result.hasErrors()) {
			return "musinfoMain";
		}
		System.out.println("찜하기 처리 호출");
		
		//회원번호
		MemberVO member=(MemberVO)session.getAttribute("member");
		pickVO.setMem_num(member.getMem_num());
		
		//ContentsVO contents = (ContenstVO)session.getAttribute("contents");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", pickVO.getMem_num());
		map.put("mus_num", pickVO.getMus_num());
		
		// 찜 확인
		int count = pickService.selectRowCount(map);
		System.out.println("//count: "+ count);
		
		if(count == 0) {
			pickService.insertPick(pickVO);
		}else if(count > 0) {
			pickService.deletePick(pickVO);
		}
		
		return "redirect:/musinfo/musinfoMain.do";
	}
	
	
}
