package kr.spring.admin.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.admin.service.AdminMusicalService;
import kr.spring.admin.vo.AdminMusicalVO;
import kr.spring.util.PagingUtil;

@Controller
public class AdminMusicalController {
	private Logger log = Logger.getLogger(this.getClass());

	// 객체 주입
	@Resource
	AdminMusicalService adminMusicalService;

	// 자바빈 초기화
	@ModelAttribute
	public AdminMusicalVO initCommand() {
		System.out.println("//뮤지컬자바빈 초기화");
		return new AdminMusicalVO();
	}

	// 뮤지컬 등록
	@RequestMapping(value = "/admin/adminMusicalRegister.do", method = RequestMethod.GET)
	public String registerForm() {
		System.out.println("//뮤지컬등록 폼 호출");
		return "adminMusicalRegister";
	}

	// 뮤지컬 등록 처리
	@RequestMapping(value = "/admin/adminMusicalRegister.do", method = RequestMethod.POST)
	public String registerSubmit(@Valid AdminMusicalVO adminMusicalVO, BindingResult result, HttpServletRequest request,
			HttpSession session) {
		System.out.println("//뮤지컬등록 처리 메소드 호출");

		if (log.isDebugEnabled()) {
			log.debug("<<뮤지컬 정보 저장>> : " + adminMusicalVO);
		}

		// 유효성 체크 결과 오류가 있으면 폼 호출
		if (result.hasErrors()) {
			System.out.println("//오류발생");
			return "adminMusicalRegister";
		}

		// 등록하기
		adminMusicalService.insertMusical(adminMusicalVO);
		System.out.println("//등록 완료");
		return "redirect:/admin/adminMusicalList.do";
	}

	// 뮤지컬 수정/삭제(리스트 보기)
	@RequestMapping("/admin/adminMusicalList.do")
	public ModelAndView adminMusicalList(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
			@RequestParam(value = "keyfield", defaultValue = "") String keyfield,
			@RequestParam(value = "keyword", defaultValue = "") String keyword) {
		System.out.println("//*******뮤지컬 리스트 호출*******");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		System.out.println("//map: " + map);

		// 총 글의 갯수 또는 검색된 글의 갯수 구하기
		int count = adminMusicalService.selectRowCount(map);
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
		List<AdminMusicalVO> list = null;
		if (count > 0) {
			list = adminMusicalService.selectList(map);
			System.out.println("//list : " + list);

			if (log.isDebugEnabled()) {
				log.debug("<<뮤지컬 목록>> : " + list);
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminMusicalList");
		mav.addObject("list", list);
		mav.addObject("count", count);
		mav.addObject("pagingHtml", page.getPagingHtml());
		System.out.println("//mav: " + mav);
		return mav;
	}
	//뮤지컬 수정 폼
	@RequestMapping(value="/admin/adminMusicalModify.do",method=RequestMethod.GET)
	public String form(@RequestParam int mus_num,
						Model model) {
		AdminMusicalVO adminMusicalVO = adminMusicalService.selectMusical(mus_num);
		
		model.addAttribute("adminMusicalVO",adminMusicalVO);
			
		
		return "adminMusicalModify";
	}
	
	

}
