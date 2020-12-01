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
	public ModelAndView process1(@RequestParam(value="pageNum", defaultValue="1") int currentPage,
								@RequestParam(value="keyfield",defaultValue="") String keyfield,
								@RequestParam(value="keyword",defaultValue="") String keyword){
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		// 뮤지컬 총 레코드 수
		int count = musMainService.selectMusMainCount(map);
		System.out.println("//count: " + count);
		if (log.isDebugEnabled()) {
			log.debug("<<count>> : " + count);
		}

		// 페이징 처리 - 검색
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, 20, 10, "musMain.do");
		
		// 페이지 시작 숫자, 끝 숫자
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		/*// 검색 목록 호출
		List<MusMainVO> list = null;
		if(count > 0) {
			list = musMainService.selectMusMainList(map);
			
			if(log.isDebugEnabled()) {
				log.debug("<<글 목록>> : " + list );
			}
		}	*/
		
		// 신작순 목록 호출
		List<MusMainVO> latestList = null;
		
		if(count > 0) {
			latestList = musMainService.selectMusLatestList(map);
			
			if(log.isDebugEnabled()) {
				log.debug("<<신작 목록>> : " + latestList );
			}
			
		}
		
		// 인기순 목록 호출
		List<MusMainVO> popularList = null;
		if(count > 0) {
			popularList = musMainService.selectMusPopularList(map);
		}
		
		// 선호장르 목록 호출
		List<MusMainVO> preferList = null;
		if(count > 0) {
			preferList = musMainService.selectMusPreferList(map);
		}
		
		// 찜한 목록 호출
		List<MusMainVO> pickList = null;
		if(count > 0) {
			pickList = musMainService.selectMusPickList(map);
		}		
		
		ModelAndView mav = new ModelAndView();
		// 뷰 이름 설정 - ""에 tiles 명 넣기
		mav.setViewName("main");
		// 데이터 저장
		mav.addObject("count", count);
		//mav.addObject("list", list);
		mav.addObject("latestList", latestList);
		mav.addObject("popularList", popularList);
		mav.addObject("preferList", preferList);
		mav.addObject("pickList", pickList);
		mav.addObject("pagingHtml", page.getPagingHtml());

		return mav;
	}
	
	// 메인 검색 목록
	@RequestMapping("/main/musMainList.do")
	public ModelAndView process(@RequestParam(value="pageNum", defaultValue="1") int currentPage,
								@RequestParam(value="keyfield",defaultValue="") String keyfield,
								@RequestParam(value="keyword",defaultValue="") String keyword){
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		// 뮤지컬 총 레코드 수
		int count = musMainService.selectMusMainCount(map);
		System.out.println("//count: " + count);
		if (log.isDebugEnabled()) {
			log.debug("<<count>> : " + count);
		}

		// 페이징 처리 - 검색
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, 20, 10, "musMainList.do");
		
		// 페이지 시작 숫자, 끝 숫자
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		// 검색 목록 호출
		List<MusMainVO> list = null;
		if(count > 0) {
			list = musMainService.selectMusMainList(map);
			
			if(log.isDebugEnabled()) {
				log.debug("<<글 목록>> : " + list );
			}
		}		
		
		ModelAndView mav = new ModelAndView();
		// 뷰 이름 설정 - ""에 tiles 명 넣기
		mav.setViewName("mainList");
		// 데이터 저장
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());

		return mav;
	}
	
	//DB에 저장된 포스터 이미지를 view에 출력
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



