package kr.spring.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.admin.service.AdminMemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PagingUtil;

@Controller
public class AdminMemberController {
	private Logger log = Logger.getLogger(this.getClass());

	//객체 주입
	@Resource
	AdminMemberService adminMemberService;
	
	//자바빈 초기화
	@ModelAttribute
	public MemberVO initCommand() {
		System.out.println("//멤버자바빈 초기화");
		return new MemberVO();
	}
	//관리자 관리
	@RequestMapping("/admin/adminManagerList.do")
	public ModelAndView managerList(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
			@RequestParam(value = "keyfield", defaultValue = "") String keyfield,
			@RequestParam(value = "keyword", defaultValue = "") String keyword) {
		System.out.println("//****관리자 목록**************");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		System.out.println("//map: " + map);

		// 총 글의 갯수 또는 검색된 글의 갯수 구하기
		int count = adminMemberService.selectManagerCount(map);
		System.out.println("//count: " + count);
		if (log.isDebugEnabled()) {
			log.debug("<<count>> : " + count);
		}
		System.out.println("//" + currentPage + "//" + keyfield + "//" + keyword);
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, 10, 10, "list.do");
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		System.out.println("//page :" + page);
		System.out.println("//map: " + map);
		List<MemberVO> list = null;
		if (count > 0) {
			list = adminMemberService.managerList(map);
			System.out.println("//list : " + list);

			if (log.isDebugEnabled()) {
				log.debug("<<글목록>> : " + list);
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminManagerList");
		mav.addObject("list", list);
		mav.addObject("count", count);
		mav.addObject("pagingHtml", page.getPagingHtml());
		System.out.println("//mav: " + mav);
		return mav;
	}
	
	
	//회원 관리
	//회원 목록
	@RequestMapping("/admin/adminMemberList.do")
	public ModelAndView process(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
			@RequestParam(value = "keyfield", defaultValue = "") String keyfield,
			@RequestParam(value = "keyword", defaultValue = "") String keyword) {
		System.out.println("//**********회원 목록**************");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		System.out.println("//map: " + map);

		// 총 글의 갯수 또는 검색된 글의 갯수 구하기
		int count = adminMemberService.selectRowCount(map);
		System.out.println("//count: " + count);
		if (log.isDebugEnabled()) {
			log.debug("<<count>> : " + count);
		}
		System.out.println("//" + currentPage + "//" + keyfield + "//" + keyword);
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, 10, 10, "list.do");
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		System.out.println("//page :" + page);
		System.out.println("//map: " + map);
		List<MemberVO> list = null;
		if (count > 0) {
			list = adminMemberService.selectList(map);
			System.out.println("//list : " + list);

			if (log.isDebugEnabled()) {
				log.debug("<<글목록>> : " + list);
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminMemberList");
		mav.addObject("list", list);
		mav.addObject("count", count);
		mav.addObject("pagingHtml", page.getPagingHtml());
		System.out.println("//mav: " + mav);
		return mav;
	}
	//회원 상세보기
	@RequestMapping("/admin/adminMemberDetail.do")
	public String form(@RequestParam int mem_num,
			Model model) {
	System.out.println("//*******회원 상세 보기");
	MemberVO vo = adminMemberService.selectMember(mem_num);
	System.out.println("//MemberVO : " + vo);
	model.addAttribute("memberVO",vo);
	
	return "adminMemberDetail";
	}
	
	
	
}