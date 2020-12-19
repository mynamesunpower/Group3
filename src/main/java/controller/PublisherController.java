package controller;

import model.vo.PublisherVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import service.PublisherService;

import java.util.List;

@Controller
@RequestMapping(value = "publisher/")
public class PublisherController {

    @Autowired
    private PublisherService publisherService; // 서비스 연결
    
    private final String _url = "publisher/"; // publisher 폴더 내부 기본 url
    private final String redirectUrl = "redirect:/publisher/"; // redirect url

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

    // 목록 출력 페이지 요청 메소드
    @RequestMapping(value = "listPublisher.ing")
    public String listPublisher(PublisherVO publisherVO, Model model) {

        model.addAttribute("publisherList", publisherService.listPublisher(publisherVO)); // 뷰페이지로 publisherList 보냄

        List<PublisherVO> list = publisherService.listPublisher(publisherVO); // 테스트용 (나중에지울것)
        for (PublisherVO publisher : list) { // 테스트용 for문(나중에지울것)
            System.out.println(publisher.getPublisherNumber() + "/" + publisher.getPublisherName());
        }

        return _url + "listPublisher";
    }
}
