package controller;
import model.vo.BookVO;
import model.vo.PurchaseVO;
import model.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.impl.BookServiceImpl;
import service.impl.PurchaseServiceImpl;
import service.impl.ReviewServiceImpl;
import service.service.PurchaseService;
import service.service.ReviewService;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;
@Controller
public class BookController {
    @Autowired
    private BookServiceImpl bookService;
    @Autowired
    private ReviewServiceImpl reviewService;
    @Autowired
    private PurchaseServiceImpl purchaseService;
    @Autowired
    private HttpSession httpSession;
    @RequestMapping("showBook.ing")
    public String showBook(HttpServletRequest request, Model model) {
        model.addAttribute("isbn", request.getParameter("isbn"));   // 선택한 책에 맞는 isbn 넘겨줌
        return "showBook";
    }
    /**
     * 선택한 ISBN의 도서 정보 보기
     *
     * @param vo
     * @param reviewVO 해당 도서의 isbn을저장하여 리뷰정보를 가져오는데 사용
     * @param model
     * @return
     */
    @RequestMapping(value = "viewBook.ing")
    public String viewBook(BookVO vo, ReviewVO reviewVO, Model model) {
        // 회원이 해당 상품을 샀는지 안샀는지 알아보기 위해 해쉬맵 생성해서 데이터 전송
        System.out.println(("viewbook() 54line "+ httpSession.getAttribute("memberTel")));
        System.out.println(("viewbook() 54line "+ vo.getIsbn()));

        Map purchaseMap = new HashMap();
        purchaseMap.put("memberTel", (String) httpSession.getAttribute("memberTel"));
        purchaseMap.put("isbn", vo.getIsbn());
        // 해당 회원의 번호와 isbn으로 상품 구매 여부 확인
        List<PurchaseVO> purchaseList = purchaseService.selectPurchase(purchaseMap);
        System.out.println(("viewbook() 54line "+ purchaseList.size()));
        for (PurchaseVO purchaseVO : purchaseList){
            model.addAttribute("orderNumber", purchaseVO.getOrderNumber());
        }
        if (purchaseList.size() > 0) {
            model.addAttribute("writeReview", "구매이력있음");
        } else {
            model.addAttribute("writeReview", "구매이력없음");
        }
        List<ReviewVO> reviewList = reviewService.seeReview(reviewVO);
        List<ReviewVO> score = reviewService.bookScore(reviewVO);
        Double scoreSum = 0.0;
        for (ReviewVO result : score) {
            scoreSum += result.getScore();
        }
        Double scoreAvg = (Math.round(scoreSum / score.size()*10)/10.0);
        System.out.println("viewBook() 49Line 점수 : " + scoreAvg);
        Map ratingOptions = new HashMap();
        ratingOptions.put(0, "☆☆☆☆☆");
        ratingOptions.put(1, "★☆☆☆☆");
        ratingOptions.put(2, "★★☆☆☆");
        ratingOptions.put(3, "★★★☆☆");
        ratingOptions.put(4, "★★★★☆");
        ratingOptions.put(5, "★★★★★");
        int zero = 0;
        int one = 1;
        int two = 2;
        int three = 3;
        int four = 4;
        int five = 5;
        model.addAttribute("zero", zero);
        model.addAttribute("one", one);
        model.addAttribute("two", two);
        model.addAttribute("three", three);
        model.addAttribute("four", four);
        model.addAttribute("five", five);
        model.addAttribute("scoreAvg", scoreAvg);
        model.addAttribute("reviewVO", reviewVO);
        model.addAttribute("ratingOptions", ratingOptions);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("viewBook", bookService.selectBook(vo));
        return "book/viewBook";
    }
    //책 검색
    @RequestMapping("/searchBook.ing")
    public String searchBook(String keyword,
                             @RequestParam(defaultValue = "false") String sbox,
                             Model model) {
        HashMap map = new HashMap<>();
        map.put("find", keyword);
        if (!sbox.equals("false")) {
            System.out.println("sbox " + sbox);
            map.put("sbox", sbox);
        } else {
            System.out.println("sbox null");
            map.put("sbox", null);
        }
        List<BookVO> bookList = bookService.searchBook(map);
        model.addAttribute("keyword", keyword);
        model.addAttribute("result", bookList.size());
        model.addAttribute("bookList", bookList);
        return "book/bookList";
    }
    @RequestMapping("/{ing}")
    public String ing(@PathVariable String ing) {
        System.out.println("BookController에서" + ing + "요청");
        return ing;
        //return "book/" + ing;
    }
    //    @RequestMapping("/hello.ing")
//    public String carousel(Model model, String genre){
//        model.addAttribute("carouselBook",bookService.carouselBook());
//        model.addAttribute("bestBook",bookService.bestBook());
//        model.addAttribute("hotBook",bookService.hotBook(genre));
//        return "hello";
//    }
    //도서 등록
    @RequestMapping("/insertBook.ing")
    public String insertBook() {
        return "book/insertBook";
    }
    //도서 입력 성공 페이지에서 도서목록보기
    @RequestMapping("/rbookList.ing")
    public String listBook() {
        System.out.println("listBook.ing 요청");
        return "redirect:bookList.ing";
    }
    // 도서입력
    @RequestMapping("/insertBook_success.ing")
    public String insertBook_success(BookVO vo) {
        System.out.println("?");
        /*@RequestParam(value = "imageFile", required = false) MultipartFile imageFile
        if (!imageFile.isEmpty()) {
            File file = new File("E:/Group3/Group3/web/imgs/book/"+vo.getIsbn()+".PNG");
            try {
                imageFile.transferTo(file);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }*/
        System.out.println("[관리자] 책 정보 입력 --> " + vo.getPublicationDate() + "/" + vo.getIsbn() + "/" + vo.getGenre() + "/" +
                vo.getAuthor() + "/" + vo.getTitle() + "/" + vo.getContent());
        bookService.insertBook(vo);
        System.out.println("[관리자] 책 정보 입력을 완료했습니다.");
        return "book/insertBook_success";
    }
    //도서 삭제하기
    @RequestMapping("/deleteBook_success.ing")
    public String deleteBook_success(BookVO vo) {
        System.out.println("deleteBook_success.ing 요청");
        bookService.deleteBook(vo);
        return "book/deleteBook_success";
    }
    //도서정보 수정하기
    @RequestMapping("/updateBook.ing")
    public String updateBook(BookVO vo) {
        System.out.printf("updateBook.ing");
        bookService.updateBook(vo);
        return "redirect:selectBook.ing?isbn=" + vo.getIsbn();
    }
    //도서 목록보기
    @RequestMapping("/bookList.ing")
    public String bookList(BookVO vo, Model model) {
        model.addAttribute("bookList", bookService.bookList(vo));
        return "book/bookList";
    }
    //선택한 ISBN의 도서정보 수정페이지
    @RequestMapping("/selectBook.ing")
    public String selectBook(BookVO vo, Model model) {
        model.addAttribute("selectBook", bookService.selectBook(vo));
        return "book/selectBook";
    }
    //장르 별 매출 비율
    @RequestMapping(value = "/chartA.ing")
    public String chartA(Model model) throws Exception {
        System.out.println("chartA() 장르별 매출액 원 차트");
        List<Map<String, Object>> genreList = bookService.getGenreList();
        Map<String, Integer> maps = new HashMap<String, Integer>();
        for (Map<String, Object> map : genreList) {
            System.out.println(map.get("GENRE"));
            System.out.println(map.get("PRICE"));
            String key = (String) map.get("GENRE");
            int value = ((BigDecimal) map.get("PRICE")).intValue();
            maps.put(key, value);
        }
        String result = "";
        Set<String> salesKeys = maps.keySet();
        for (String key : salesKeys) {
            if (result != "") {
                result += ",";
            }
            result += "['" + key + "', " + maps.get(key) + "]";
            //((BigDecimal) hm.get("AGE")).intValue()
        }
        model.addAttribute("chartA", result);
        return "book/chartA";
    }
    //연령별, 총 매출 차트
    @RequestMapping(value = "/chartB.ing")
    public String chartB(Model model) {
        //매출 그래프
        System.out.println("chartA() booktrain 매출 line 차트");
        //-----------------------10대
        String age = "1";
        HashMap<Integer, Integer> teenage = bookService.teenageList(age);
        System.out.println("10대는:" + teenage);
        //-----------------------20대
        HashMap<Integer, Integer> twentyprice = bookService.twentypriceList();
        //-----------------------30대 그대로 추가했는데도 오히려 안되는겨?? 좀 바꿔서 추가했는데 안되고있어요
        HashMap<Integer, Integer> ageprice = bookService.ageList();
        //-----------------------40대
        age = "4";
        HashMap<Integer, Integer> fortyage = bookService.teenageList(age);
        System.out.println("40대는:" + fortyage);
        //--------------------총매출
        HashMap<Integer, Integer> salesprice = bookService.salesList();
        String result = "";
        Set<Integer> salesKeys = salesprice.keySet();
        for (Integer key : salesKeys) {
            if (result != "") {
                result += ",";
            }
            result += "['" + key + "', " + salesprice.get(key) + "," + teenage.get(key) + "," + twentyprice.get(key) + "," + ageprice.get(key) + "," + fortyage.get(key) + "]";
            //((BigDecimal) hm.get("AGE")).intValue()
        }
        System.out.println("매출 result : " + result);
        model.addAttribute("chartB", result);
        //-----------------------------------------------------------
        return "book/chartB";
    }
    //최근 30일 매출
    @RequestMapping("/chartC")
    public String daysales(Model model) {
        HashMap<Integer, Integer> list = bookService.daychart();
        String result = "";
        Set<Integer> dayKeys = list.keySet(); // [0, 1, 2, ...., 30]
        List list2 = new ArrayList(dayKeys);
        Collections.sort(list2, Collections.reverseOrder()); // [30, 29, 28, ..., 0]
        for (Object key : list2) {
            if (result != "") {
                result += ",";
            }
            if ((int) key >= 10) {
                result += "['" + (int) key + "일 전', " + list.get((int) key) + "]";
            } else if ((int) key == 0) {
                result += "['오늘', " + list.get((int) key) + "]";
            } else {
                result += "[' " + (int) key + " 일 전', " + list.get((int) key) + "]";
            }
            //((BigDecimal) hm.get("AGE")).intValue()
        }
        System.out.println("매출 result : " + result);
        model.addAttribute("chartC", result);
        return "book/chartC";
    }
    @RequestMapping("/genrebookList.ing")
    public String genrebookList(HttpServletRequest request, Model model) {
        String genre = request.getParameter("genre");
        List<BookVO> list = bookService.genrebookList(genre);
        model.addAttribute("result", list.size());
        model.addAttribute("genre", genre);
        model.addAttribute("bookList", list);
        return "book/genrebookList";
    }
    //Best book 리스트 페이지
    @RequestMapping("/bestbookList.ing")
    public String bestbookList(Model model) {
        List<BookVO> best = bookService.bestbookList();
        model.addAttribute("result", best.size());
        model.addAttribute("bestbookList", best);
        return "book/bestbookList";
    }
    @RequestMapping("/newbookList")
    public String newbookList(Model model) {
        List<BookVO> newbook = bookService.newbookList();
        model.addAttribute("result", newbook.size());
        model.addAttribute("newbookList", newbook);
        return "/book/newbookList";
    }
}
