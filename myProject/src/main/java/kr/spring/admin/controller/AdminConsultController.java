/*package kr.spring.admin.controller;

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

import kr.spring.admin.service.AdminConsultService;
import kr.spring.admin.vo.AdminConsultVO;
import kr.spring.admin.vo.NoticeVO;
import kr.spring.util.PagingUtil;

@Controller
public class AdminConsultController {
	@Resource
	private AdminConsultService adminConsultService;

	private Logger log = Logger.getLogger(this.getClass());

	// 자바빈(VO) 초기화
	@ModelAttribute
	public AdminConsultVO initCommand() {
		return new AdminConsultVO();
	}

	//
	@RequestMapping("/admin/noticeList.do")
	public ModelAndView process(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
			@RequestParam(value = "keyfield", defaultValue = "") String keyfield,
			@RequestParam(value = "keyword", defaultValue = "") String keyword) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		System.out.println("//map: " + map);

		// 총 글의 갯수 또는 검색된 글의 갯수 구하기
		int count = adminConsultService.selectRowCount(map);
		System.out.println("//count: " + count);
		if (log.isDebugEnabled()) {
			log.debug("<<count>> : " + count);
		}
		System.out.println("//" + currentPage + "//" + keyfield + "//" + keyword);
		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, 10, 10, "noticeList.do");
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		System.out.println("//page :" + page);
		System.out.println("//map: " + map);
		List<AdminConsultVO> list = null;
		if (count > 0) {
			list = adminConsultService.selectList(map);
			System.out.println("//list : " + list);

			if (log.isDebugEnabled()) {
				log.debug("<<글목록>> : " + list);
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("noticeList");
		mav.addObject("list", list);
		mav.addObject("count", count);
		mav.addObject("pagingHtml", page.getPagingHtml());
		System.out.println("//mav: " + mav);
		return mav;
	}

	// 상담내역 상세
	@RequestMapping("/admin/noticeView.do")
	public ModelAndView process(@RequestParam int con_num) {
		System.out.println("//공지사항 상세 보기 ");
		if (log.isDebugEnabled()) {
			log.debug("<<글 상세>> : " + con_num);
		}
		//상담 불러오기
		AdminConsultVO notice = adminConsultService.selectConsult(con_num);
		//상담 댓글 처리
		adminConsultService.updateConsult(con_num);
		return new ModelAndView("noticeView", "notice", con_num);
	}

}
*/