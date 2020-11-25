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
import kr.spring.member.vo.MemberVO;
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
	public String registerSubmit(@Valid AdminMusicalVO adminMusicalVO, 
			BindingResult result, 
			HttpServletRequest request,
			HttpSession session) {
		System.out.println("//뮤지컬등록 처리 메소드 호출");
		//배우이름값 콤마붙여서 넣어주기
		String[] actors = request.getParameterValues("mus_actor");
		String mus_actor = "";
		for(int i=0; i<actors.length;i++) {
			if(actors[i]==null||actors[i].equals("")) {
			 mus_actor += "";
			}
			if(i!=actors.length-1) {
			mus_actor += actors[i]+",";
			}else {
			mus_actor += actors[i];
			}
		}
		adminMusicalVO.setMus_actor(mus_actor);
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

	// 뮤지컬 리스트 보기
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
	//뮤지컬 정보 상세 보기
		@RequestMapping("/admin/adminMusicalDetail.do")
		public ModelAndView detail(@RequestParam int mus_num) {
			System.out.println("//*******뮤지컬상세 보기");
			if(log.isDebugEnabled()) {
				log.debug("<<뮤지컬 상세>>:"+mus_num);
			}
		
		AdminMusicalVO VO = adminMusicalService.selectMusical(mus_num);
		System.out.println("//AdminMusicalVO : " + VO);

		return new ModelAndView("adminMusicalDetail","adminMusicalVO",VO);
		}
	
	//뮤지컬 수정 폼 보기
		@RequestMapping(value="/admin/adminMusicalModify.do",method=RequestMethod.GET)
		public String modifyForm(@RequestParam int mus_num,
							Model model) {
			System.out.println("//*******뮤지컬 수정 폼 보기");
			AdminMusicalVO VO = adminMusicalService.selectMusical(mus_num);
			
			model.addAttribute("adminMusicalVO",VO);
				
			
			return "adminMusicalModify";
		}	
		
	//뮤지컬 수정 처리
	@RequestMapping(value = "/admin/adminMusicalModify.do",method=RequestMethod.POST)
	public String modifySubmit(@Valid AdminMusicalVO adminMusicalVO, 
			BindingResult result, 
			HttpServletRequest request,
			HttpSession session) {
		System.out.println("//뮤지컬 수정 메소드 호출");
		String[] actors = request.getParameterValues("mus_actor");
		String mus_actor = "";
		for(int i=0; i<actors.length;i++) {
			if(i!=actors.length-1) {
			mus_actor += actors[i]+",";
			}else {
			mus_actor += actors[i];
			}
		}
		
		System.out.println("//actors"+actors);
		adminMusicalVO.setMus_actor(mus_actor);
		if (log.isDebugEnabled()) {
			log.debug("<<뮤지컬 정보 수정>> : " + adminMusicalVO);
		}

		// 유효성 체크 결과 오류가 있으면 폼 호출
		if (result.hasErrors()) {
			System.out.println("//오류발생");
			return "adminMusicalModify";
		}
		
		// 등록하기
		adminMusicalService.updateMusical(adminMusicalVO);
		System.out.println("//뮤지컬 정보 수정완료");
		return "redirect:/admin/adminMusicalList.do";
	}
	
	
	//뮤지컬 삭제 폼 
	@RequestMapping(value ="/admin/adminMusicalDelete.do", method = RequestMethod.GET)
	public String submitDelete(
			@RequestParam int mus_num,Model model,HttpServletRequest request) {
		System.out.println("********뮤지컬 삭제 폼*********");
		if(log.isDebugEnabled()) {
			log.debug("<<뮤지컬 삭제>> : " + mus_num);
		}
		
		return "adminMusicalDelete";
	}
	//뮤지컬 삭제 처리
	@RequestMapping(value ="/admin/adminMusicalDelete.do", method = RequestMethod.POST)
	public String completeDelete(@RequestParam int mus_num,Model model,HttpServletRequest request) {
		System.out.println("********뮤지컬 삭제 처리*********");
		if(log.isDebugEnabled()) {
			log.debug("<<게시판 글 삭제>> : " + mus_num);
		}
		
		System.out.println("//글삭제");
		adminMusicalService.deleteMusical(mus_num);
		System.out.println("//messeage 출력");
		model.addAttribute("message","글 삭제 완료!!");
		model.addAttribute("url",request.getContextPath()+"/admin/adminMusicalList.do");
		
		return "common/result";
	}
	
	//뮤지컬 등록 미리보기
	
	//뮤지컬 수정 미리보기
	
	

}
