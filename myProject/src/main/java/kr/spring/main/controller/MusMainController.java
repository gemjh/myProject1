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

import kr.spring.main.service.MusMainService;
import kr.spring.main.vo.MusMainVO;
import kr.spring.util.PagingUtil;

@Controller
public class MusMainController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource
	private MusMainService musMainService;

	// 자바빈 초기화
	@ModelAttribute
	public MusMainVO initCommand() {
		return new MusMainVO();
	}

	// 메인 목록
	@RequestMapping("/main/musMain.do")
	public ModelAndView getList(@RequestParam(value="pageNum", defaultValue="1") int currentPage){

		// 목록 총 레코드 수
		int count = musMainService.getMusMainCount();
		System.out.println("//count: " + count);
		if (log.isDebugEnabled()) {
			log.debug("<<count>> : " + count);
		}

		// 페이징 처리
		PagingUtil page = new PagingUtil(currentPage, count, 20, 10, "musMain.do");

		// 목록 호출
		List<MusMainVO> list = null;
		if(count > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());

			list = musMainService.getMusMainList(map);
		}

		ModelAndView mav = new ModelAndView();
		// 뷰 이름 설정
		mav.setViewName("/main/musMain");
		// 데이터 저장
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());

		return mav;
	}
	//이미지출력
	@RequestMapping("/main/postView.do")
	public ModelAndView viewImage(@RequestParam int mus_num) {

		MusMainVO musMainVO = musMainService.selectMusMain(mus_num);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		//bite[]타입의 데이터
		mav.addObject("imageFile",musMainVO.getMus_post());
		mav.addObject("filename",musMainVO.getMus_postname());

		return mav;	
	}
}


