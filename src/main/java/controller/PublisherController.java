package controller;

import model.vo.PublisherListVO;
import model.vo.PublisherVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.PublisherService;
import service.PublisherServiceImpl;

import java.util.List;

@Controller
@RequestMapping(value = "publisher/")
public class PublisherController {

    @Autowired
    private PublisherService publisherService; // 서비스 연결
    
    private final String _url = "publisher/"; // publisher 폴더 내부 기본 url
    private final String redirectUrl = "redirect:/" + _url; // redirect url

    // 페이지 이동 기본 메소드
    @RequestMapping(value = "{url}.ing")
    public String movePage(@PathVariable String url) {
        return _url + url;
    }

    // 입력 페이지 요청 메소드
    @RequestMapping(value = "insertPublisher_success.ing")
    public String insertPublisher(PublisherVO publisherVO) {
        publisherService.insertPublisher(publisherVO);
        return redirectUrl + "listPublisher.ing"; // 리다이렉트는 ing 붙여야되네
    }

    // 수정 페이지 요청 메소드
    @RequestMapping(value = "modifyPublisher.ing")
    public String viewPublisher(PublisherVO publisherVO, Model model) {
        PublisherVO result = publisherService.viewPublisher(publisherVO);
        model.addAttribute("publisher", result);
        return _url + "modifyPublisher"; // 리다이렉트는 ing 붙여야되네
    }

    // 수정 페이지 제출 요청 메소드
    @RequestMapping(value = "modifyPublisher_success.ing")
    public String modifyPublisher(PublisherVO publisherVO) {
        publisherService.modifyPublisher(publisherVO);
        return redirectUrl + "listPublisher.ing"; // 리다이렉트는 ing 붙여야되네
    }

    /*// 목록 출력 페이지 요청 메소드
    @RequestMapping(value = "listPublisher.ing")
    @ResponseBody
    public ModelAndView listPublisher(PublisherVO publisherVO) {
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("publisherList", publisherService.listPublisher(publisherVO));
        return modelAndView;
    }*/

    // 목록 출력 페이지 요청 메소드
    @RequestMapping(value = "listPublisher.ing")
    public String listPublisher(PublisherVO publisherVO, Model model) {
        model.addAttribute("publisherList", publisherService.listPublisher(publisherVO)); // 뷰페이지로 publisherList 보냄
        return _url + "listPublisher"; // 얘가 강제로 보내버려 페이지를 아아.. 오늘 이거만 해결하면 수월할거같은디 ㅠ 한번 저도 알아보겠습니당
    }

    /*@RequestMapping("listPublisher.ing")
    @ResponseBody
    public PublisherListVO dataTransform(PublisherVO publisherVO) {
        List<PublisherVO> list = publisherService.listPublisher(publisherVO);
        PublisherListVO publisherListVO = new PublisherListVO();
        publisherListVO.setPublisherList(list);
        return publisherListVO;
    }*/

    @RequestMapping(value = "deletePublisher.ing")
    public String deletePublisher(PublisherVO publisherVO) {
        int result = publisherService.deletePublisher(publisherVO);
        return redirectUrl + "listPublisher.ing";
    }
}
