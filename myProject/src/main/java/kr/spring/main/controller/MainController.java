package kr.spring.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.admin.vo.AdminMusicalVO;
import kr.spring.main.service.MainService;
import kr.spring.main.vo.MainVO;
import kr.spring.util.PagingUtil;

@Controller
public class MainController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	MainService mainService;
	
	// 자바빈 초기화
	@ModelAttribute
	public MainVO initCommand() {
		System.out.println("//뮤지컬자바빈 초기화");
		return new MainVO();
	}

	
	@RequestMapping("/main/mainList.do")
	public ModelAndView MainList(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
			@RequestParam(value = "keyfield", defaultValue = "") String keyfield,
			@RequestParam(value = "keyword", defaultValue = "") String keyword) {
		System.out.println("//*******뮤지컬 리스트 호출*******");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		System.out.println("//map: " + map);

		// 총 글의 갯수 또는 검색된 글의 갯수 구하기
		int count = mainService.selectRowCount(map);
		System.out.println("//count: " + count);
		if (log.isDebugEnabled()) {
			log.debug("<<count>> : " + count);
		}
		System.out.println("//" + currentPage + "//" + keyfield + "//" + keyword);
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, 10, 10, "mainList.do");
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		System.out.println("//page :" + page);
		System.out.println("//map: " + map);
		List<MainVO> list = null;
		if (count > 0) {
			list = mainService.selectList(map);
			System.out.println("//list : " + list);

			if (log.isDebugEnabled()) {
				log.debug("<<뮤지컬 목록>> : " + list);
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mainList");
		mav.addObject("list", list);
		mav.addObject("count", count);
		mav.addObject("pagingHtml", page.getPagingHtml());
		System.out.println("//mav: " + mav);
		return mav;
	}
	//뮤지컬 정보 상세 보기
	@RequestMapping("/main/mainDetail.do")
	public ModelAndView detail(@RequestParam int mus_num) {
		System.out.println("//*******뮤지컬상세 보기");
		if(log.isDebugEnabled()) {
			log.debug("<<뮤지컬 상세>>:"+mus_num);
		}
	
	MainVO VO = mainService.selectMusical(mus_num);
	System.out.println("//MainVO : " + VO);

	return new ModelAndView("mainDetail","mainVO",VO);
	}

	//이미지 출력
	@RequestMapping("/main/postView.do")
	public ModelAndView viewImage(@RequestParam int mus_num) {
		System.out.println("//*****이미지 출력*********");
		MainVO mainVO = mainService.selectMusical(mus_num);
		System.out.println("//MainVO : "+ mainVO);
		ModelAndView mav = new ModelAndView();
		System.out.println("//mav : "+mav);
		mav.setViewName("imageView");
		mav.addObject("imageFile",mainVO.getMus_post());
		mav.addObject("filename", mainVO.getMus_postname());
		System.out.println("//mav : "+ mav);
		return mav;
	}	
		
	
	/*@RequestMapping("/main/main.do")
	public String getMain() {
		return "main";
	}*/
}



