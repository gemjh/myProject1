package kr.spring.musinfo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.musinfo.service.ContentsService;
import kr.spring.musinfo.vo.ContentsVO;
import kr.spring.util.PagingUtil;

@Controller
public class ContentsController {
	private Logger log=Logger.getLogger(this.getClass());
	@Resource
	ContentsService contentsService;
	
	//자바빈 초기화
	@ModelAttribute
	public ContentsVO initCommand() {
		return new ContentsVO();
	}
	//뮤지컬 소개 페이지
	@RequestMapping("/musinfo/musinfoDetail.do")
	public ModelAndView detail(@RequestParam int mus_num) {
		System.out.println("//*******뮤지컬상세 보기");
		if(log.isDebugEnabled()) {
			log.debug("<<뮤지컬 상세>>:"+mus_num);
		}
		
	//뮤지컬번호에서 정보 가져오기
	ContentsVO VO = contentsService.selectContents(mus_num);
	System.out.println("//ContentsVO : " + VO);

	return new ModelAndView("musinfoMain","contentsVO",VO);
	}
	@RequestMapping(value = "/musinfo/musinfoMain.do",method=RequestMethod.POST)
	public String modifySubmit(@Valid ContentsVO contentsVO, BindingResult result, HttpServletRequest request) {
		String[] actors = request.getParameterValues("mus_actor");
		String mus_actor = "";
			for(int i=0; i<actors.length;i++) {
				if(actors[i]!=null && !actors[i].equals("")) {
					if(i !=0) {
					mus_actor += ",";	
					}
					mus_actor += actors[i];	
				}
			}
			contentsVO.setMus_actor(mus_actor);

		System.out.println("//actors"+actors);
		return null;
		
	}
	//이미지 출력
		@RequestMapping("/musinfo/imageView.do")
		public ModelAndView viewImage(@RequestParam int mus_num) {
			System.out.println("//*****이미지 출력*********");
			ContentsVO contentsVO = contentsService.selectContents(mus_num);
			System.out.println("//VO : "+contentsVO);
			ModelAndView mav = new ModelAndView();
			System.out.println("//mav : "+mav);
			mav.setViewName("imageView");
			mav.addObject("imageFile",contentsVO.getMus_post());
			mav.addObject("filename",contentsVO.getMus_postname());
			System.out.println("//mav : "+mav);
			return mav;
		}

}
